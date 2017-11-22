class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  def start(*)
    response = from ? "Привет, #{from['username']}!" : "Привет!"
    respond_with :message, text: (response + info)
  end

  def select_hostel(hostel_id = nil, *)
    if hostel_id && Building.find_by(id: hostel_id).present?
      session[:hostel_id] = hostel_id
      respond_with :message,
      text: (%Q(Вы выбрали общежитие "#{Building.find_by(id: hostel_id)}") + info)
    else
      res = ['Укажите идентификатор общежития в ответном сообщении.']
      res << "\r\b"
      Building.all.each { |b| res << %Q(#{b.id} — если хотите выбрать "#{b.name}") }

      respond_with :message, text: res.join("\r\n")
      save_context :select_hostel
    end
  end

  def select_room(room_number = nil, *)
    if room_number
      session[:room_number] = room_number
      respond_with :message, text: (%Q(Вы указали комнату "#{session[:room_number]}") + info)
    else
      res = ['Укажите номер комнаты в ответном сообщении.']
      respond_with :message, text: res.join("\r\n")
      save_context :select_room
    end
  end

  def new_issue(issue_description = nil, *)
    if session[:hostel_id].blank?
      respond_with :message, text: ('Сначала нужно выбрать своё общежитие.' + info)
    elsif session[:room_number].blank?
      respond_with :message, text: ('Сначала нужно указать свою комнату.' + info)
    else
      if issue_description
        issue = Issue.create(building_id: session[:hostel_id],
                             room: session[:room_number],
                            description: issue_description)
        respond_with :message, text: ('Ваша задача добавлена.' + info)
      else
        res = ['Укажите текст задачи в ответном сообщении.']
        respond_with :message, text: res.join("\r\n")
        save_context :new_issue
      end
    end
  end

  private

  def info
    res = ["\r\n", '____________________']

    if session[:hostel_id]
      res << %Q(Ваше общежитие — "#{Building.find_by(id: session[:hostel_id])}". Воспользуйтесь командой /select_hostel, чтобы изменить его.)
    else
      res << 'Воспользуйтесь командой /select_hostel, чтобы указать своё общежитие.'
    end

    if session[:room_number]
      res << %Q(Ваша комната — #{session[:room_number]}. Воспользуйтесь командой /select_room, чтобы изменить её.)
    else
      res << 'Воспользуйтесь командой /select_room, чтобы указать свою комнату.'
    end

    res << 'Воспользуйтесь командой /new_issue, чтобы добавить новую задачу.'

    res.join("\r\n")
  end
end

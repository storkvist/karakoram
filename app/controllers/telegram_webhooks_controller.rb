class TelegramWebhooksController < Telegram::Bot::UpdatesController
  def start(*)
    response = [from ? "Привет, #{from['username']}!" : "Привет!"]
    response << "\r\b"
    response << 'Выбрать общежитие — /hostel'
    respond_with :message, text: response.join("\r\n"), reply_markup: {
      keyboard: [
        [
          'Выбрать общежитие — /hostel',
          '/cancel'
        ]
      ],
      resize_keyboard: true,
      one_time_keyboard: true,
      selective: true
    }
  end

  def hostel(*)
    res = ['Выберите общежитие:']
    Building.all.each { |b| res << "#{b.name} /sb#{b.id}" }
    respond_with :message, text: res.join("\r\n")
  end

  def new_issue(*)
    res = ['Выберите общежитие:']
    Building.all.each { |b| res << "#{b.name} /#{b.id}" }
    respond_with :message, text: res.join("\r\n")
  end
end

class TelegramWebhooksController < Telegram::Bot::UpdatesController
  def start(data = nil, *)
    response = from ? "Привет, #{from['username']}!" : "Привет!"
    respond_with :message, text: response
  end
end

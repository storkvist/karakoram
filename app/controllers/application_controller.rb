class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html do
        redirect_to main_app.new_user_session_path, notice: exception.message
      end
      format.js { head :forbidden, content_type: 'text/html' }
      format.json { head :forbidden, content_type: 'text/html' }
    end
  end
end

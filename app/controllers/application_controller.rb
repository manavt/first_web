class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception, unless: Proc.new {|r|
        r.request.format.json?
  }

  before_action :verify_session, unless: Proc.new {|c| c.request.format.json?}
  def verify_session
    if session[:user_id].nil?
      redirect_to signin_path
    end
  end

  def current_user
    User.find session[:user_id]
  end
end

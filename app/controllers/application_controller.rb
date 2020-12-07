class ApplicationController < ActionController::Base
  before_action :check_login
  protect_from_forgery with: :exception
  include SessionsHelper

  def check_login
    unless logged_in?
      redirect_to sessions_new_path
    end
  end

end

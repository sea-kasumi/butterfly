class SessionsController < ApplicationController
  skip_before_action :check_login,only:[:new,:create]
  def new
    @user = User.new
  end

  def create
    user = User.find_by(account: params[:session][:account].downcase)
    if user && user.password == params[:session][:password]
      log_in(user)
      redirect_to home_top_path, notice: 'ログインしました'
    else
      #エラーメッセージ生成
      flash.now.alert = "もう一度入力してください"
      render :new
    end
  end

  def destroy
    log_out
  end

end

module SessionsHelper

    #ログイン処理
    def log_in(user)
        session[:user_id] = user.user_id
    end

    #現在ログインしているユーザを返す
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    #ログインしているかを返す
    def logged_in?
        !current_user.nil?
    end

    #ログアウト処理
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end

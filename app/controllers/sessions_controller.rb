class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to my_page_path, notice: "ログインしました"
    else
      render 'home/index', flash: { error: "ユーザー名またはパスワードが間違っています" }
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "ログアウトしました"
  end
end

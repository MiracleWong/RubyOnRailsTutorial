class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面
      log_in(user)
      remember(user)
      redirect_to(user)
    else
      # 创建一个错误信息
      flash.now[:danger] = 'Invalid email/password combination' #不完全正确
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

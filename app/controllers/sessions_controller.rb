class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "#{@user.name} さん、こんにちは"
      redirect_to @user
    else
       flash[:danger] = 'メールアドレスかパスワードが間違っています。'
       render 'new'
    end
  end
    
  def destroy
    session[:user_id] = nil
    flash[:success] = 'また会えるのを楽しみにしています。'
    redirect_to root_path
  end
end

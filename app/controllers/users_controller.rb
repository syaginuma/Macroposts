class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ようこそ、Micropostsへ!!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @micropost = @user.microposts
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "変更を保存しました"
    else
      render 'edit'
    end
  end
  
  def followings
     @user = User.find(params[:id])
     @following_users = @user.following_users(other_user)
  end
  
  def followers
     @user = User.find(params[:id])
     @follower_users = @user.follower_users(other_user)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :body, :password, :password_confirmation)
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :followings, :followers, :edit, :update]
  before_action :check_user, only: [:edit, :update]

  def show
    @microposts = @user.microposts.order(created_at: :desc)
    set_ff
  end
  
  def followings
    set_ff
  end
    
  def followers
    set_ff
  end
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      # 保存に成功した場合はプロフィールページへリダイレクト
      redirect_to current_user
      flash[:success] =  'ユーザー情報を編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :place, :profile, :password,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def check_user
    if !logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to login_path
    elsif @user.id != current_user.id
      flash[:danger] = '自分以外のユーザーのプロフィールは編集できません。'
      redirect_to root_path
    end
  end

  def set_ff
    @following_users = @user.following_users.order(created_at: :desc)
    @follower_users = @user.follower_users.order(created_at: :desc)
  end

end
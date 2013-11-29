class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destory
  
  def show
  	@user = User.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      flash[:error] = "你浏览的内容去火星了"
      redirect_to root_path
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "欢迎加入UCDNews的大家庭"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "个人信息修改成功"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end

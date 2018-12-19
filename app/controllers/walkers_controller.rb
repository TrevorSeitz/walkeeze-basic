class WalkersController < ApplicationController
  def new
    @user = User.new
    # redirect_to '/users/new_walker'
  end

  # def create
  #   byebug
  #   if user_params[:password] == user_params[:password_confirmation]
  #     @user = User.find_by_email(user_params[:email])
  #     if @user
  #       redirect_to root_path, notice: "You are already registered, Please log in"
  #     else
  #       @user = User.create(user_params)
  #       byebug
  #       redirect_to user_path(@user.id), notice: "Welcome to Walkeeze!! "
  #     end
  #   else
  #     redirect_to new_user_path, notice: "Passwords do not match"
  #   end
  # end

  def index
    @users = User.where(walker: true)
  end

  def show
    @dogs = Dog.where(user_id: @user.id)
    redirect_to user_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:name], email: params[:email])

    redirect_to walker_path(@user), notice: "Update Successful"
  end


  def edit
    @user = User.find(params[:id].to_i)
  end

  # 
  # private
  #
  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_id, :walker)
  # end


end

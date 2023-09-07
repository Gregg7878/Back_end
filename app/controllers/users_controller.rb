class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :login]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render json: { user: @user, message: 'User registered successfully' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { user: @user, message: 'User logged in successfully' }, status: :ok
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def logout
    session.delete(:user_id)
    render json: { message: 'User logged out successfully' }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :age, :password)
  end

  def authenticate_user
    unless current_user
      render json: { message: 'Unauthorized' }, status: :unauthorized
    end
  end
end
class UsersController < ApplicationController
  before_action :authorize_request, except: :create

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def delete
    if @user.destroy
      render json: { message: "Usuario deletado com sucesso" },
             status: :ok
    end
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])

  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Usuario nao encontrado' },
           status: :not_found
  end

  def user_params
    params.permit(:name, :username, :password, :password_confirmation)
  end
end


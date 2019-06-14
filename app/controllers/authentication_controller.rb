# coding: utf-8
class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_username(params[:username])

    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)

      render json: {
                     token: token,
                     username: @user.username,
                     name: @user.name
                   },status: :ok
    else
      render json: { error: 'Usuário não autorizado.' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
 

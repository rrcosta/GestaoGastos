# ApplicationController
class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])

    rescue ActiveRecord::RecordNotFound => e
      render json: { 
                     errors: "Registro não encontrado. Detalhe:: #{e.message}"
                   }, status: :unauthorized

    rescue JWT::DecodeError => e
      render json: { 
                      errors: "Token nao informado OU invalido. Detalhe:: #{e.message}"
                   }, status: :unauthorized
    end
  end
end

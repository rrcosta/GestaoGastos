# Generates SECRET_KEY for JWT
class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base[0..25].to_s

  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end

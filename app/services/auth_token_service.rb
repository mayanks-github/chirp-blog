class AuthTokenService
  def self.generate_token(user_id)
    payload = { user_id: user_id }
    exp = 24.hours.from_now
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end

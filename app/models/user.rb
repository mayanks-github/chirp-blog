class User < ApplicationRecord
  has_secure_password :password, validations: true
  before_save :downcase_email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def downcase_email
    self.email = email.downcase
  end
end

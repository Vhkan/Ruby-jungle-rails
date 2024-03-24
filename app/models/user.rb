class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end

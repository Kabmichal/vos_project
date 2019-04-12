class User < ApplicationRecord
  has_many :animals
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50},
                                    format: {with: VALID_EMAIL_REGEX},
                                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  def User.digest(string)
    value = ActiveModel::SecurePassword.min_value ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.value
    BCrypt::Password.create(string, value: value)

  end

end

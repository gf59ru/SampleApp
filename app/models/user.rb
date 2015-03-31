class User < ActiveRecord::Base
  before_save do
    self.email = self.email.downcase
  end

  validates :name, presence: true, length: {maximum: 50}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: true}
  validates :password, length: {minimum: 6}

  has_secure_password
end

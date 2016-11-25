class User < ActiveRecord::Base
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
validates :password, presence: true,length: {minimum: 6}
validates :password_confirmation, presence: true,length: {minimum: 6}
validates :name, presence: true,length: {maximum: 50}
validates :email, presence: true,length: {maximum: 255},
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: {case_sensitive:false}
before_save {self.email=email.downcase}
has_secure_password
end

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates_uniqueness_of :username
end

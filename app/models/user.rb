class User < ApplicationRecord
  # Включаем хеширование пароля
  has_secure_password
  # Устанавливаем связь "один ко многим" с сообщениями, удаляем все сообщения при удалении пользователя
  has_many :messages, dependent: :destroy
  # Устанавливаем валидацию наличия имени пользователя
  validates_presence_of :username
  # Устанавливаем валидацию наличия пароля
  validates_presence_of :password
  # Устанавливаем валидацию наличия подтверждения пароля
  validates_presence_of :password_confirmation
  # Устанавливаем валидацию уникальности имени пользователя
  validates_uniqueness_of :username
end

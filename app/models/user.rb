class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  validates :display_name, allow_nil: true, length: { in: 2..32 }
  EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  validates :email, presence: true, length: { maximum: 255 },
                              format: { with: EMAIL_REGEX },
                              uniqueness: { case_sensitive: false }
  has_secure_password
end

class User < ActiveRecord::Base
  has_many :orders

  before_save { self.email = email.downcase }
  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  validates :display_name, allow_nil: true, length: { in: 2..32 }
  validate :display_name_is_not_blank
  validates :email, presence: true, length: { maximum: 255 },
                              format: { with: /@/ },
                              uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :admin, inclusion: { in: [true, false] }

  def display_name_is_not_blank
    errors.add(:display_name, 'Display name cannot be an empty string') if self.display_name && self.display_name.blank? 
  end
end

class User < ActiveRecord::Base
  before_save { self.email = email.downcase } # converts all emails to downcase before saving
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } # allows validation to equate user@email.com to USER@EMAIL.COM

  has_secure_password
  validates :password, :password_confirmation, length: { minimum: 6 }
  
end

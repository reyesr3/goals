class Lender < ActiveRecord::Base
  has_secure_password

  has_many :histories
  has_many :money_lent, through: :histories


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :money, presence: true
  validates :email, presence: true, format: { with:EMAIL_REGEX }, :uniqueness => { :case_sensitive => false }
end

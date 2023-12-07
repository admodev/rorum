class User < ApplicationRecord
  has_one_attached :avatar

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Only letters and numbers are allowed." }
end

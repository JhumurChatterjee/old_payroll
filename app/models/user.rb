class User < ApplicationRecord
  has_secure_password
  belongs_to :organization

  validates :name, :password_digest, length: { maximum: 250 }, presence: true
end

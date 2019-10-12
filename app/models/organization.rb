class Organization < ApplicationRecord
  email_regex = /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i
  validates :name, length: { maximum: 250 }, presence: true
  validates :email, length: { maximum: 250 }, presence: true, format: { with: email_regex }
  validates :password, length: { maximum: 250 }
end

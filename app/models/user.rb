class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :location, :password, presence: true, length: { in: 2..20 }
  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_many  :rsvps, foreign_key: 'attendee_id'
  has_many  :events, through: 'rsvps'
  has_many  :comments
end

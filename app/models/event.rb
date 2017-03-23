class Event < ActiveRecord::Base
  validates :name, :date, :city, :state, presence: true, length: { in: 2..20 }
  belongs_to :user
  has_many :rsvps
  has_many :comments
  has_many :attendees, through: 'rsvps'

end

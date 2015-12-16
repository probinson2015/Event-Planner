class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :location, :state, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 6}, on: :create
  has_many :events
  has_many :attendees
  has_many :events_attending, through: :attendees, source: :event
end

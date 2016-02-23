class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :attending, through: :attendees, source: :user
  has_many :comments
  validates :name, :date, :location, :state, :user_id, presence: :true
end

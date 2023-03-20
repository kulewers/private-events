class Event < ApplicationRecord
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :event_attendee
  belongs_to :host, class_name: "User"

  validates :title, :description, :location, :date, presence: true\

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }

end

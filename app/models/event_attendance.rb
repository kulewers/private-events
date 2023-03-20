class EventAttendance < ApplicationRecord
  belongs_to :event_attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"
  validates :event_attendee, :attended_event, presence: true
end

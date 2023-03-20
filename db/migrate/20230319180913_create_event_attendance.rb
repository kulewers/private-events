class CreateEventAttendance < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
      t.belongs_to :event_attendee, foreign_key: { to_table: :users }
      t.belongs_to :attended_event, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @event_attendance = current_user.event_attendances.build(attended_event_id: params[:event_id])

    if @event_attendance.save
      redirect_to event_path(params[:event_id])
    else
      flash[:notice] = @event_attendance.errors.full_messages.to_sentence
    end
  end
  
  private

  def event_attendance_params
    params
      .require(:event_attendance)
      .permit(:attended_event)
      .merge(attended_event: params[:event_id])
  end
end

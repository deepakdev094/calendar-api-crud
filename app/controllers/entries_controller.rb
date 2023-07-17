class EntriesController < ApplicationController
  require 'google/apis/calendar_v3'
  CREATOR_USER = User.first

  def index 
    google_calendar_service = GoogleCalendarService.new(CREATOR_USER)
    @events = google_calendar_service.list_events
  end

  def new
    @entry = CREATOR_USER.entries.new
  end

  def create
    @entry = CREATOR_USER.entries.new(entry_params)
  
    if @entry.save
      calendar_service = GoogleCalendarService.new(CREATOR_USER)
      calendar_service.create_event(@entry)
      redirect_to root_path, notice: 'Event created successfully!'
    else
      render :new
    end
  end
  
  private
  def entry_params
    params.require(:entry).permit(:start_time, :end_time, :summary, :description)
  end
end

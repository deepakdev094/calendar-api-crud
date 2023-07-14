class EntriesController < ApplicationController
  require 'google/apis/calendar_v3'
  CALENDAR_ID = 'saifuddin.s@preciousinfosystem.com'
  
  def index 
    google_calendar_service = GoogleCalendarService.new
    @events = google_calendar_service.list_events
  end
  
  def new
    @entry = User.first.entries.new
  end
  def create
    @entry = User.first.entries.new(entry_params)
    
    if @entry.save
      calendar_service = GoogleCalendarService.new
      calendar_service.create_event(@entry)
      redirect_to root_path, notice: 'Event created successfully!'
      byebug
    else
      render :new
    end
  end
  
  private

  def entry_params
    params.require(:entry).permit(:start_time, :end_time, :summary, :description)
  end
end

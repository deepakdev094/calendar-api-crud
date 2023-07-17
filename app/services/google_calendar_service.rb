class GoogleCalendarService
  require 'google/apis/calendar_v3'
  CALENDAR_ID = 'siddiquetester@gmail.com'
  def initialize(user)
    @user = user
    @calendar_service = Google::Apis::CalendarV3::CalendarService.new
    credentials = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(Rails.root.join('config', 'credentials', 'google_calendar_key.json')),
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR
    )
    @calendar_service.authorization = credentials
  end

  def list_events
    @calendar_service.list_events(CALENDAR_ID)
  end

  def create_event(entry)
    event = Google::Apis::CalendarV3::Event.new(
      summary: entry.summary,
      start: Google::Apis::CalendarV3::EventDateTime.new(date_time: entry.start_time.to_datetime),
      end: Google::Apis::CalendarV3::EventDateTime.new(date_time: entry.end_time.to_datetime),
      description: entry.description
    )
    @calendar_service.insert_event(CALENDAR_ID, event)
  end
end

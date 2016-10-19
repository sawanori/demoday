json.extract! event, :id, :event_title, :event_content, :event_charge, :member_count, :user_id, :spot_id, :event_day, :created_at, :updated_at
json.url event_url(event, format: :json)
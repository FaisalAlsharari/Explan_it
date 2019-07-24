json.extract! appointment, :id, :place, :accepted, :tutor, :course, :user_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

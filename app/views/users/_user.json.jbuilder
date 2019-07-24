json.extract! user, :id, :name, :is_tutor, :email, :password, :university_name, :created_at, :updated_at
json.url user_url(user, format: :json)

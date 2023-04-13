json.extract! user, :id, :name, :password_digest, :email, :role_id, :created_at, :updated_at
json.url user_url(user, format: :json)

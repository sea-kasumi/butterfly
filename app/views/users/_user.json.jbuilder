json.extract! user, :id, :account, :password, :grade, :class, :number, :name, :graduate, :teacher, :created_at, :updated_at
json.url user_url(user, format: :json)

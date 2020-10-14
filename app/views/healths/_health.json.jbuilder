json.extract! health, :id, :user_id, :temperature, :condition, :symptom_id, :day, :created_at, :updated_at
json.url health_url(health, format: :json)

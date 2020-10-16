json.extract! users_to_offer, :id, :user_id, :offer_id, :created_at, :updated_at
json.url users_to_offer_url(users_to_offer, format: :json)

json.extract! offer, :id, :partner_id, :description, :voucher, :category, :url, :created_at, :updated_at
json.url offer_url(offer, format: :json)

json.extract! account, :id, :number, :bank_id, :holder_id, :agency_code, :created_at, :updated_at
json.url account_url(account, format: :json)

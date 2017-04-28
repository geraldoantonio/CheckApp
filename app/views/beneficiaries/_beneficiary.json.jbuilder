json.extract! beneficiary, :id, :name, :email, :address, :phone_1, :phone_2, :created_at, :updated_at
json.url beneficiary_url(beneficiary, format: :json)

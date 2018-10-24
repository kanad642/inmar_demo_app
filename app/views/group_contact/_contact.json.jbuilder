json.extract! contact, :id, :name, :email, :phone, :status, :group_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)

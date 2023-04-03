json.extract! pet_sitter, :id, :name, :email, :description, :cost, :created_at, :updated_at
json.url pet_sitter_url(pet_sitter, format: :json)

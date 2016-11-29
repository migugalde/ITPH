json.extract! room, :id, :name, :color, :created_at, :updated_at
json.url room_url(room, format: :json)
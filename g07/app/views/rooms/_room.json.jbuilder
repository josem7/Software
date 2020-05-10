json.extract! room, :id, :nombre, :ubicacion, :ptje_disponibilidad, :ptje_enchufes, :ptje_ruido, :created_at, :updated_at
json.url room_url(room, format: :json)

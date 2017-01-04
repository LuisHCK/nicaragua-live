json.array!(@items) do |item|
  json.extract! item, :id, :titulo, :descripcion, :precio, :ubicacion, :estado, :valoracion
  json.url item_url(item, format: :json)
end

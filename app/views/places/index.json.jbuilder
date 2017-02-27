json.array!(@places) do |place|
  json.extract! place, :id, :location, :image_url, :visit_length, :favorite_memory
  json.url place_url(place, format: :json)
end

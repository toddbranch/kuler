json.array!(@palettes) do |palette|
  json.extract! palette, :id, :name
  json.url palette_url(palette, format: :json)
end

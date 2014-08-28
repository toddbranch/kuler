json.array!(@palettes) do |palette|
  json.extract! palette, :id, :name, :slug
  json.url palette_url(palette, format: :json)
end

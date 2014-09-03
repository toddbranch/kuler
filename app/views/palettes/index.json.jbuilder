json.array!(@palettes) do |palette|
  json.extract! palette, :id, :name
end

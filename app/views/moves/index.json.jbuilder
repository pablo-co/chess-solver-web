json.array!(@moves) do |move|
  json.extract! move, :id
  json.url move_url(move, format: :json)
end

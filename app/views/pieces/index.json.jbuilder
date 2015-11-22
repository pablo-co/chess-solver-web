json.array!(@pieces) do |piece|
  json.extract! piece, :id
  json.url piece_url(piece, format: :json)
end

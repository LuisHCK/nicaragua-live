json.array!(@markets) do |market|
  json.extract! market, :id, :title, :description
  json.url market_url(market, format: :json)
end

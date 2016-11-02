class StoreService
  def self.nearest_by_zipcode(zipcode)
    conn = Faraday.new(url: "https://api.bestbuy.com")
    parameters = {
      format: 'json',
      pageSize: 50,
      apiKey: ENV['api_key'],
      show: 'longName,city,distance,phone,storeType'
    }

    res = conn.get "/v1/stores(area(#{zipcode},25))", parameters
    results = JSON.parse(res.body)
    results['stores']
  end
end

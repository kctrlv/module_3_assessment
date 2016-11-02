class Store
  attr_reader :longName, :city, :distance, :phone, :storeType
  def self.nearest_by_zip(zipcode)
    conn = Faraday.new(url: "https://api.bestbuy.com")
    parameters = {
      format: 'json',
      pageSize: 50,
      apiKey: ENV['api_key'],
      show: 'longName,city,distance,phone,storeType'
    }
    res = conn.get "/v1/stores(area(#{zipcode},25))", parameters
    # "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=50&apiKey=#{ENV['api_key']}"
    # require "pry"; binding.pry
    results = JSON.parse(res.body)['stores']
    results.map { |store| Store.new(store) }
  end

  def initialize(params)
    @longName = params['longName']
    @city = params['city']
    @distance = params['distance']
    @phone = params['phone']
    @storeType = params['storeType']
  end
end

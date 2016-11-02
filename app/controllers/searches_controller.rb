class SearchesController < ApplicationController
  def show
    zip = params['s']
    @zipcode = zip
    conn = Faraday.new(url: "https://api.bestbuy.com")
    parameters = {
      format: 'json',
      pageSize: 50,
      apiKey: ENV['api_key']
    }
    res = conn.get "/v1/stores(area(#{zip},25))", parameters
    # "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=50&apiKey=#{ENV['api_key']}"
    require "pry"; binding.pry
    results = JSON.parse(res.body)
  end
end

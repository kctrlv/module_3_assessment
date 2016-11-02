class Store
  attr_reader :longName, :city, :distance, :phone, :storeType
  def self.nearest_by_zip(zipcode)
    stores = StoreService.nearest_by_zipcode(zipcode)
    stores.map { |store| Store.new(store) }
  end

  def initialize(params)
    @longName = params['longName']
    @city = params['city']
    @distance = params['distance']
    @phone = params['phone']
    @storeType = params['storeType']
  end
end

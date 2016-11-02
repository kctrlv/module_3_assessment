require "rails_helper"

RSpec.describe StoreService do
  it 'can get stores by nearest zipcode' do
    zipcode = '80202'
    stores = StoreService.nearest_by_zipcode(zipcode)
    expect(stores.count).to eq(17)
    store = stores.last
    expect(store['longName']).to eq("Best Buy - Boulder")
  end
end

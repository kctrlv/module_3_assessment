require "rails_helper"

RSpec.describe Store do
  it 'can get stores by nearest zipcode' do
    zipcode = '80202'
    stores = Store.nearest_by_zip(zipcode)
    expect(stores.count).to eq(17)
    store = stores.first
    expect(store.city).to eq("Denver")
    expect(store.distance).to eq(3.25)
    expect(store.longName).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(store.phone).to eq("303-270-9189")
    expect(store.storeType).to eq("Mobile")
  end
end

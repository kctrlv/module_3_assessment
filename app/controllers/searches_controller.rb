class SearchesController < ApplicationController
  def show
    zip = params['s']
    @zipcode = zip
    @stores = Store.nearest_by_zip(@zipcode)
  end
end

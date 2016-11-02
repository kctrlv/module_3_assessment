class SearchesController < ApplicationController
  def show
    @zipcode = params['s']
    @stores = Store.nearest_by_zip(@zipcode).first(15)
  end
end

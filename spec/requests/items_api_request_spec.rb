require 'rails_helper'

describe 'Items API', :type => :request do
  it 'gets all items' do
    item1 = Item.create(name: "a", description: "a", image_url: "a")
    item2 = Item.create(name: "b", description: "b", image_url: "b")
    item3 = Item.create(name: "c", description: "c", image_url: "c")
    # When I send a GET request to `/api/v1/items`
    get "/api/v1/items"
    # I receive a 200 JSON response containing all items
    expect(response.status).to eq(200)
    res = JSON.parse(response.body, symbolize_names: true)
    expect(res.class).to eq(Array)
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
    expect(!!res.first[:id]).to eq(true)
    expect(!!res.first[:name]).to eq(true)
    expect(!!res.first[:description]).to eq(true)
    expect(!!res.first[:image_url]).to eq(true)
    expect(!!res.first[:created_at]).to eq(false)
    expect(!!res.first[:updated_at]).to eq(false)
  end

  it 'gets one item' do
    item1 = Item.create(name: "a", description: "a", image_url: "a")
    # When I send a GET request to `/api/v1/items/1`
    get "/api/v1/items/#{item1.id}"
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(response.status).to eq(200)
    res = JSON.parse(response.body, symbolize_names: true)
    expect(res.class).to eq(Hash)
    expect(!!res[:id]).to eq(true)
    expect(!!res[:name]).to eq(true)
    expect(!!res[:description]).to eq(true)
    expect(!!res[:image_url]).to eq(true)
    expect(!!res[:created_at]).to eq(false)
    expect(!!res[:updated_at]).to eq(false)
  end

  it 'deletes one item' do
    item1 = Item.create(name: "a", description: "a", image_url: "a")
    # When I send a DELETE request to `/api/v1/items/1`
    delete "/api/v1/items/#{item1.id}"
    # I receive a 204 JSON response if the record is successfully deleted
    expect(response.status).to eq(204)
  end

  it 'creates one item' do
    # When I send a POST request to `/api/v1/items` with a name, description, and image_url
    post "/api/v1/items", params: {name: "Jim", description: "Bob", image_url: "www.google.com"}
    # I receive a 201 JSON  response if the record is successfully created
    expect(response.status).to eq(201)

    # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    res = JSON.parse(response.body, symbolize_names: true)
    expect(res.class).to eq(Hash)
    expect(!!res[:id]).to eq(true)
    expect(!!res[:name]).to eq(true)
    expect(!!res[:description]).to eq(true)
    expect(!!res[:image_url]).to eq(true)
    expect(!!res[:created_at]).to eq(false)
    expect(!!res[:updated_at]).to eq(false)
  end


end

class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    Item.find(params[:id]).destroy
    render json: {}, status: 204
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: Item.find(item.id), status: 201
    else
      render json: {}, status: 404
    end
  end

  private

  def item_params
    params.require(:params).permit(:name, :description, :image_url)
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :prefecture_id, :category_id, :condition_id, :postage_payer_id, :ship_date_estimate_id).merge(user_id: current_user.id)
  end
end

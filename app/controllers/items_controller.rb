class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "商品を出品しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :prefecture_id, :category_id, :condition_id, :postage_payer_id, :ship_date_estimate_id).merge(user_id: current_user.id)
  end
end

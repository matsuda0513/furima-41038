class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :prefecture_id, :category_id, :condition_id, :postage_payer_id, :ship_date_estimate_id).merge(user_id: current_user.id)
  end
end

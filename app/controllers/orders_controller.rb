class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item

  def index
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

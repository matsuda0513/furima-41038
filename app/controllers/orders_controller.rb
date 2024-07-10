class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item
  before_action :redirect_if_not_signed_in, only: [:index, :create]
  before_action :redirect_if_not_purchasable, only: [:index, :create]

  def index
    if @item.user == current_user || @item.order.present?
      redirect_to root_path, alert: 'この商品は購入できません。'
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @order_address = OrderAddress.new
    end
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_if_not_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def redirect_if_not_purchasable
    if @item.user == current_user || @item.order.present?
      redirect_to root_path, alert: 'この商品は購入できません。'
    end
  end
end

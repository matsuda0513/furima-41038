class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item

  def index
    # if @item.user == current_user || @item.order.present?
    #   redirect_to root_path, alert: 'この商品は購入できません。'
    # end
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    # if @item.user == current_user || @item.order.present?
    #   redirect_to root_path, alert: 'この商品は購入できません。'
    # end
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  # def show
  #   if @item.user == current_user
  #     redirect_to root_path
  #   end
  # end

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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end

class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含めてください' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true,
                           format: { with: /\A\d{10,11}\z/, message: 'は半角数字で10桁または11桁で入力してください' }
  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,
                   phone_number: phone_number, order_id: order.id)
  end
end

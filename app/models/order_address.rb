class OrderAddress
  include ActiveModel::Model
  attr_accessor :name, :price, :postage_payer, :postal_code,
                :prefecture_id, :user_id, :city, :address, :building_name, :phone_number

  validates :name, presence: true
  validates :price, presence: true,
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999,
                      message: 'は300~9999999の半角数値での入力が必要です'
                    }
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(price: price, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name, order_id: order_id) # rubocop:disable Style/HashSyntax
  end
end

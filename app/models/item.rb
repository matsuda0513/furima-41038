class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date_estimate

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true,
                    greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を選択して下さい"}
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "を選択して下さい" }
  validates :postage_payer_id, presence: true, numericality: { other_than: 1, message: "を選択して下さい" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "を選択して下さい" }
  validates :ship_date_estimate_id, presence: true, numericality: { other_than: 1, message: "を選択して下さい" }
end

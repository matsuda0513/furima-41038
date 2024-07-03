class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :ship_date_estimate_id, presence: true
end

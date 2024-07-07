class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefecture

  # validates :postal_code, presence: true
  # validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  # validates :city, presence: true
  # validates :address, presence: true
  # validates :phone_number, presence: true
end

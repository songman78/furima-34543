class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code1, :prefecture_id, :city, :address, :building, :phone_number,:order,:user_id,:item_id

  with_options presence: true do
    validates :zip_code1, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: {with: \A0[5789]0[-]?\d{4}[-]?\d{4}\z}
    validates :user
    validates :item
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(zip_code1: zip_code1, prefecture_id: prefecture_id, city: city, address: address, building: building, order_id: order.id)
  end
end
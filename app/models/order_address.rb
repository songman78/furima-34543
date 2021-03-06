class OrderAddress
  include ActiveModel::Model
  attr_accessor  :zip_code1,:prefecture_id, :city, :address, :building, :phone_number,:user_id,:item_id,:token

  with_options presence: true do
    validates :zip_code1, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 0}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A^[0-9]+$\z/ },length: {maximum: 11}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(zip_code1: zip_code1, prefecture_id: prefecture_id, city: city, address: address, building: building,phone_number: phone_number, order_id: order.id)
  end
end
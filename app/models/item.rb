class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_change
  belongs_to :delivery_days
  belongs_to :prefecture

  with_options presence: true do
    validates :user
    validates :title, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_change_id
      validates :delivery_days_id
      validates :prefecture_id
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    end
  end
end

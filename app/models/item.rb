class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :user
    validates :title
    validates :text
  with_options numericality: { other_than: 1 } 
    validates :category_id
    validates :condition_id 
    validates :delivery_change_id
    validates :delivery_days_id
    validates :prefecture_id
    validates :price
  end
  end
end

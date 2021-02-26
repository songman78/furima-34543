class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i },on: :create
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :last_name 
      validates :first_name
    end
    with_options format: { with: /\A([ァ-ン]|ー)+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end 
    validates :birth_date
  end
end

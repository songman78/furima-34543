class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i },on: :create
    validates :nickname
    validates :last_name, format: { with: /[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /[ぁ-んァ-ン一-龥]/}
    validates :last_name_kana,format: {with: /([ァ-ン]|ー)/}
    validates :first_name_kana,format: {with: /([ァ-ン]|ー)/}
    validates :birth_date
  end
end

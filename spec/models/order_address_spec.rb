require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入処理' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'zip_code1が空だと保存できないこと' do
      @order_address.zip_code1 = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip code1 can't be blank")
    end
    it 'zip_code1が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.zip_code1 = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip code1 is invalid")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @order_address.prefecture_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idは0意外選択していないと保存できないこと' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it 'cityは空では保存できないこと' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressは空では保存できないこと' do
      @order_address.address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @order_address.building = ""
      expect(@order_address).to be_valid
    end
    it 'phone_numberは空では保存できないこと' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは11桁以内の数値だと保存できる' do
      @order_address.phone_number = "09012345678"
      expect(@order_address).to be_valid
    end

    it 'tokenの情報がないと保存できないこと' do
      @order_address.token = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idの情報がないと保存できない' do
      @order_address.user_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idの情報がないと保存できない' do
      @order_address.item_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end

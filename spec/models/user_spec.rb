require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の半角英数字であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include  ("Password is too short (minimum is 6 characters)")
      end
      it 'emailは＠を含まないと登録できないこと' do
        @user.email = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")  
      end
      it 'passwordは英語のみでは登録できないこと' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")  
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")  
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = "アイウエオカ"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")  
      end
      it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name is invalid")  
      end
      it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name is invalid")  
      end
      it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
        @user.first_name_kana = "abecd"
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana is invalid")  
      end
      it 'last_name_kanaは全角カタカナ以外では登録できないこと' do
        @user.last_name_kana = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana is invalid")  
      end
    end
  end
end

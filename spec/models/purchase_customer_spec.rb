require 'rails_helper'

RSpec.describe PurchaseCustomer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user:)
    @purchase_customer = FactoryBot.build(:purchase_customer, item_id: item.id, user_id: user.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必要な情報を適切に入力してtokenがあれば「購入」ボタンを押すと購入できる' do
        expect(@purchase_customer).to be_valid
      end

      it 'building_nameは空でも「購入」ボタンを押すと購入できる' do
        @purchase_customer.building_name = ''
        expect(@purchase_customer).to be_valid
      end
    end

    context '購入できないとき' do
      it 'post_codeが空では購入できない' do
        @purchase_customer.post_code = ''
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが2桁-4桁では購入できない' do
        @purchase_customer.post_code = '12-34567'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが4桁-3桁では購入できない' do
        @purchase_customer.post_code = '1234-567'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが3桁-3桁では購入できない' do
        @purchase_customer.post_code = '124-567'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが4桁-4桁では購入できない' do
        @purchase_customer.post_code = '1234-5678'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが全角数字でなければ購入できない' do
        @purchase_customer.post_code = '１２３-４５６７'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが半角英字では購入できない' do
        @purchase_customer.post_code = 'asd-fghj'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeがひらがなでは購入できない' do
        @purchase_customer.post_code = 'あいう-えおかき'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが全角カタカナでは購入できない' do
        @purchase_customer.post_code = 'アイウ-エオカキ'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが半角カタカナでは購入できない' do
        @purchase_customer.post_code = 'ｱｲｳ-ｴｵｶｷ'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeが漢字では購入できない' do
        @purchase_customer.post_code = '亜亜亜-亜亜亜亜'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Post code is invalid')
      end

      it 'prefecture_idを選択しなければ購入できない' do
        @purchase_customer.prefecture_id = '0'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @purchase_customer.city = ''
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空では購入できない' do
        @purchase_customer.street_address = ''
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @purchase_customer.phone_number = ''
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字のみでなければ購入できない' do
        @purchase_customer.phone_number = '03-111-2222'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角数字では購入できない' do
        @purchase_customer.phone_number = '１２３４５６７８９９９'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it '半角英字では購入できない' do
        @purchase_customer.phone_number = 'asdfghjklpo'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberがひらがなでは購入できない' do
        @purchase_customer.phone_number = 'あああああああああああ'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角カタカナでは購入できない' do
        @purchase_customer.phone_number = 'アアアアアアアアアアア'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが漢字では購入できない' do
        @purchase_customer.phone_number = '亜亜亜亜亜亜亜亜亜亜亜'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが9桁桁以下では購入できない' do
        @purchase_customer.phone_number = '123456789'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁桁以上では購入できない' do
        @purchase_customer.phone_number = '123456789012'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idがが空では購入できない' do
        @purchase_customer.user_id = ''
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがが空では購入できない' do
        @purchase_customer.item_id = ''
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では購入できない' do
        @purchase_customer.token = ''
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

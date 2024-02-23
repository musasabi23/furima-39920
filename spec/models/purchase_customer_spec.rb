require 'rails_helper'

RSpec.describe PurchaseCustomer, type: :model do
  before do
    @purchase_customer = FactoryBot.build(:purchase_customer)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必要な情報を適切に入力して「購入」ボタンを押すと購入できる' do
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
        expect(@purchase_customer.errors.full_messages).to include("Phone number is invalid")

        @purchase_customer.phone_number = '１２３４５６７８９９９'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Phone number is invalid")

        @purchase_customer.phone_number = 'asdfghjklpo'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Phone number is invalid")

        @purchase_customer.phone_number = 'あああああああああああ'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Phone number is invalid")

        @purchase_customer.phone_number = 'アアアアアアアアアアア'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Phone number is invalid")

        @purchase_customer.phone_number = '亜亜亜亜亜亜亜亜亜亜亜'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが10桁以上11桁以内でなければ購入できない' do
        @purchase_customer.phone_number = '123456789'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Phone number is invalid")

        @purchase_customer.phone_number = '123456789012'
        @purchase_customer.valid?
        expect(@purchase_customer.errors.full_messages).to include("Phone number is invalid")
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
    end
  end
end

      
require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規出品できるとき' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが41字以上では登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'descriptionが1001字以上では登録できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字以外では登録できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = 'ａｂｃｄ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = 'ひらがな'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = 'カタカナ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = '漢字'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'category_idを選択していないと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'quality_idを選択していないと登録できない' do
        @item.quality_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end

      it 'delivery_cost_idを選択していないと登録できない' do
        @item.delivery_cost_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
      end

      it 'prefecture_idを選択していないと登録できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_duration_idを選択していないと登録できない' do
        @item.shipping_duration_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping duration can't be blank")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'user_idが空では登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

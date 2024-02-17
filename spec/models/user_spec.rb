require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる' do
        
      end
    end

    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
              end

      it 'emailが空では登録できない' do

      end

      it 'emailが一意性でなければ登録できない' do
        
      end

      it 'emailに@が含まれていなければ登録できない' do
        
      end

      it 'passwordが空では登録できない' do
        
      end

      it 'passwordが5文字以下では登録できない' do
        
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        
      end

      it 'passwordが129文字以上では登録できない' do
        
      end

      it 'passwordは半角英数字混合でなければ登録できない' do
        
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        
      end

      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        
      end

      it 'first_name_kanaは全角（カタカナ）でなければ登録できない' do
        
      end

      it 'last_name_kanaは全角（カタカナ）でなければ登録できない' do
        
      end

      it 'birsday（年）が--では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'birsday（月）が--では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

      it 'birsday（日）が--では登録できない' do
        # emailが空では登録できないテストコードを記述します
      end

    end
  end
end

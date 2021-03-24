require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '#create' do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @address_purchase = FactoryBot.build(:address_purchase, user_id: user.id, item_id: item.id)
      sleep 0.1 # ユーザーや商品を生成することでDBとのやりとりが発生し、エラーとなる場合が考えられるためsleepメソッドをはさみます。復習する為に残す。
    end

    context '登録に成功する時' do

      it '入力欄を全て埋めれば登録できること' do
        expect(@address_purchase).to be_valid
      end

      it '建物名に入力されていなくても登録できること' do
        @address_purchase.tatemonomei = ''
        expect(@address_purchase).to be_valid
      end
    end

    context '登録に失敗する時' do
      it 'Postal codeは空では登録できないこと' do
        @address_purchase.postal_code = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'shikucyousonが空では登録できないこと' do
        @address_purchase.shikucyouson = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Shikucyouson can't be blank")
      end

    
      it 'bannchiは空では登録できないこと' do
        @address_purchase.bannchi = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Bannchi can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @address_purchase.phone_number = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'address1_idが1の場合は登録できないこと' do
        @address_purchase.address1_id = 1
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Address1 can't be blank")
      end

      it '郵便番号の保存にはハイフンが必要であること' do
        @address_purchase.postal_code = '1234567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '電話番号は11桁以内の数値のみ保存可能なこと' do
        @address_purchase.phone_number = '123456789012'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      
      it "tokenが空では登録できないこと" do
        @address_purchase.token = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idは空では登録できないこと' do
        @address_purchase.user_id = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'bannchiは空では登録できないこと' do
        @address_purchase.item_id = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Item can't be blank")
      end

      it '電話番号が半角英数混合では登録できないこと' do
        @address_purchase.phone_number = '12ab'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end

end

require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '#create' do
    before do
      @address_purchase = FactoryBot.build(:address_purchase)
    end

    context '登録に成功する時' do
      it '入力欄を全て埋めれば登録できること' do
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

      

      # it 'priceが全角数字では登録できないこと' do
      #   @address_purchase.price = '１１１１'
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Price Half-width number')
      # end

      # it '半角英数混合では登録できないこと' do
      #   @address_purchase.price = '12aa'
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Price Half-width number')
      # end

      # it '半角英語だけでは登録できないこと' do
      #   @address_purchase.price = 'aaa'
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Price Half-width number')
      # end

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
      
        # it 'status_idが1の場合は登録できないこと' do
      #   @address_purchase.status_id = 1
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Status must be other than 1')
      # end

      # it 'fee_idが1の場合は登録できないこと' do
      #   @address_purchase.fee_id = 1
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Fee must be other than 1')
      # end

      # it 'address1_idが1の場合は登録できないこと' do
      #   @address_purchase.address1_id = 1
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Address1 must be other than 1')
      # end

      # it 'day_idが1の場合は登録できないこと' do
      #   @address_purchase.day_id = 1
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Day must be other than 1')
      # end

      # it '販売価格が¥300より少ない時は出品できないこと' do
      #   @address_purchase.price = 299
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Price Out of setting range')
      # end

      # it '販売価格が¥9999999より多い時は出品できないこと' do
      #   @address_purchase.price = 10_000_000
      #   @address_purchase.valid?
      #   expect(@address_purchase.errors.full_messages).to include('Price Out of setting range')
      # end

      it "tokenが空では登録できないこと" do
        @address_purchase.token = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
      end

    end
  end

end

















# require 'rails_helper'

# RSpec.describe User, type: :model do
#   before do
#     @user = FactoryBot.build(:user)
#   end
# end
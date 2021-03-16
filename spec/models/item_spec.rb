require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end



    context '登録に成功する時' do

      it '入力欄を全て埋めれば登録できること' do
        expect(@item).to be_valid
      end


    end



    context '登録に失敗する時' do
      it 'imageは空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it 'priceが全角数字では登録できないこと' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it 'itemは空では登録できないこと' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end

      it 'explanationが空では登録できないこと' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "category_idが1の場合は登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "status_idが1の場合は登録できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "fee_idが1の場合は登録できないこと" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end

      it "address1_idが1の場合は登録できないこと" do
        @item.address1_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Address1 must be other than 1")
      end

      it "day_idが1の場合は登録できないこと" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it "販売価格が¥300より少ない時は出品できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '販売価格が¥9999999より多い時は出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '入力欄を全て埋めれば登録できること' do
      expect(@user).to be_valid
    end

    it 'emailは@がないと登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'nameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'myouji_kanjiがない場合は登録できないこと' do
      @user.myouji_kanji = ''
      @user.valid?
      expect(@user.errors[:myouji_kanji]).to include("can't be blank")
    end

    it 'myouji_kanjiは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.myouji_kanji = 'ra-men'
      @user.valid?
      expect(@user.errors[:myouji_kanji]).to include('is invalid')
    end

    it 'namae_kanjiがない場合は登録できないこと' do
      @user.namae_kanji = ''
      @user.valid?
      expect(@user.errors[:namae_kanji]).to include("can't be blank")
    end

    it 'namae_kanjiは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.namae_kanji = 'sushi'
      @user.valid?
      expect(@user.errors[:namae_kanji]).to include('is invalid')
    end

    it 'myouji_katakanaがない場合は登録できないこと' do
      @user.myouji_katakana = ''
      @user.valid?
      expect(@user.errors[:myouji_katakana]).to include("can't be blank")
    end

    it 'myouji_katakanaは全角カタカナ以外では登録できないこと' do
      @user.myouji_katakana = 'niku肉にくnumber1'
      @user.valid?
      expect(@user.errors[:myouji_katakana]).to include('is invalid')
    end

    it 'namae_katakanaがない場合は登録できないこと' do
      @user.namae_katakana = ''
      @user.valid?
      expect(@user.errors[:namae_katakana]).to include("can't be blank")
    end

    it 'namae_katakanaは全角カタカナ以外では登録できないこと' do
      @user.namae_katakana = 'niku肉にくnumber1'
      @user.valid?
      expect(@user.errors[:namae_katakana]).to include('is invalid')
    end

    it 'seinenngappiがない場合は登録できないこと' do
      @user.seinenngappi = ''
      @user.valid?
      expect(@user.errors[:seinenngappi]).to include("can't be blank")
    end

    it 'パスワードに英小文字が含まれない場合無効な状態であること' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors[:password]).to include('は半角6~1000文字英小文字・数字それぞれ１文字以上含む必要があります')
    end

    it 'パスワードに数字が含まれない場合無効な状態であること' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:password]).to include('は半角6~1000文字英小文字・数字それぞれ１文字以上含む必要があります')
    end
  end
end

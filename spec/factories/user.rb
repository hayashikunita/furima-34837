FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    nickname { Faker::JapaneseMedia::OnePiece.character }
    myouji_kanji { '佐藤' }
    namae_kanji { '拓哉' }
    myouji_katakana { 'サトウ' }
    namae_katakana { 'タクヤ' }
    seinenngappi { '1998-11-29' }
  end
end

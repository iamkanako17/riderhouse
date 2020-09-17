require 'rails_helper'

describe Lodging do
  before do
    @lodging = FactoryBot.build(:lodging)
  end

  context '宿の登録うまくいくとき' do
    it '全ての情報が記述されている' do
      expect(@lodging).to be_valid
    end
  end

  context '宿の登録がうまく行かない時' do
    it 'imagesが空の時' do
      @lodging.images = nil
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Imagesを入力してください')
    end

    it '宿の名前が空の時' do
      @lodging.lodge_name = ''
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Lodge nameを入力してください')
    end

    it 'priceが999未満だと登録出来ない' do
      @lodging.price = 998
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Priceは一覧にありません')
    end

    it 'priceが全角数字だと登録できない' do
      @lodging.price = '１０００'
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Priceは数値で入力してください')
    end

    it 'priceが9,999,999以上だと登録出来ない' do
      @lodging.price = 10_000_000
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Priceは一覧にありません')
    end

    it 'postcodeにハイフンがないと登録できない' do
      @lodging.postcode = 1_234_567
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Postcodeは不正な値です')
    end

    it 'prefecture_idが０だと登録できない' do
      @lodging.prefecture_id = 0
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Prefectureは0以外の値にしてください')
    end

    it 'cityがないと登録できない' do
      @lodging.city = ''
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Cityを入力してください')
    end

    it 'block_numberがないと登録できない' do
      @lodging.block_number = ''
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Block numberを入力してください')
    end

    it 'descriptionが空だと登録できない' do
      @lodging.description = nil
      @lodging.valid?
      expect(@lodging.errors.full_messages).to include('Descriptionを入力してください')
    end

  end
end

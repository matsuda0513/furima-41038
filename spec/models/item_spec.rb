require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の登録' do
    context '商品が出品できる場合' do
      it '必須項目が存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    describe '商品出品' do
      context '商品出品ができる場合' do
        it '全ての項目が正しく入力されていれば出品できる' do
          expect(@item).to be_valid
        end
      end
      context '商品出品ができない場合' do
        it '画像が空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が空では出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it '価格が空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格が300未満では出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price は300~9999999の半角数値での入力が必要です')
        end
        it '価格が9999999を超えると出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price は300~9999999の半角数値での入力が必要です')
        end
        it '価格が半角数字でないと出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price は300~9999999の半角数値での入力が必要です')
        end
        it 'カテゴリーが1では出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category を選択して下さい')
        end
        it '商品の状態が1では出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition を選択して下さい')
        end
        it '配送料の負担が1では出品できない' do
          @item.postage_payer_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Postage payer を選択して下さい')
        end
        it '発送元の地域が1では出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture を選択して下さい')
        end
        it '発送までの日数が1では出品できない' do
          @item.ship_date_estimate_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Ship date estimate を選択して下さい')
        end
      end
    end
  end
end

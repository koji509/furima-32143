require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it "すべて正しいフォーマットで入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品がうまくいかないとき' do
      it "product_nameが空だと出品できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "explanationが空では出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category Select")
      end
      it "status_idが空だと出品できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status Select")
      end
      it "delivery_idが空だと出品できない" do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank", "Delivery Select")
      end
      it "area_idが空だと出品できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area Select")
      end
      it "day_idが空だと出品できない" do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day Select")
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price Half-width number", "Price Out of setting range")
      end
      it "priceが全角だと出品できない" do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが300円以下だと出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが9999999円以上だと出品できない" do
        @item.price = '9999999'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
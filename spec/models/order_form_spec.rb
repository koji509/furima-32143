require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_form,user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '購入がうまくいくとき' do
      it "すべて正しいフォーマットで入力されていれば購入できる" do
        expect(@order).to be_valid
      end
      it "建物名が空でも購入できること" do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '購入がうまくいかないとき' do
      it "tokenが空では購入できないこと" do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "tokenが16文字以下では購入できないこと" do
        @order.token = '424242424242424'
        @order.valid?
        expect(@order.errors.full_messages).to include()
      end
      it "postal_codeが空では購入できないこと" do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
      end
      it "postal_codeがハイフン無しでは購入できないこと" do
        @order.postal_code = '1231234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeが7桁以下では購入できないこと" do
        @order.postal_code = '123-123'  
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code Input correctly")
      end
      it "prefecture_idが1では購入できないこと" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end
      it "cityが空では購入できないこと" do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では購入できないこと" do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it "building_nameが空では購入できないこと" do
        @order.building_name = ''
        @order.valid?
        expect(@order.errors.full_messages).to include()
      end
      it "phone_numberが空では購入できないこと" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
      end
      it "phone_numberがハイフン有りでは購入できないこと" do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input only number")
      end
      it "user_idが無いと購入できないこと" do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが無いと購入できないこと" do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it "phone_numberが12桁以上では購入できないこと" do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが数字のみじゃないと購入できないこと" do
        @order.phone_number = 'avb//@aefe1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end

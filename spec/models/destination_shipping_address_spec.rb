require 'rails_helper'

RSpec.describe DestinationShippingAddress, type: :model do
  describe '購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @destination_shipping_address = FactoryBot.build(:destination_shipping_address,user_id: user.id,item_id: item.id)
      sleep 1
    end  

    context '購入できる時' do
      it '全て入力があれば登録できる' do
        expect(@destination_shipping_address).to be_valid
      end
    end
    context '購入できない時' do
      it "zip_codeが空では登録できないこと" do
        @destination_shipping_address.zip_code = ''
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it "zip_codeが半角のハイフンを含んだ正しい形式出ないと登録できないこと" do
        @destination_shipping_address.zip_code = '1234567'
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it "Prefectureが空では登録できないこと" do
        @destination_shipping_address.prefecture_id = 0
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では登録できないこと" do
        @destination_shipping_address.city = ''
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it "adressが空では登録できないこと" do
        @destination_shipping_address.adress = ''
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Adress can't be blank")
      end
      it "building_nameが空でも登録できること" do
        expect(@destination_shipping_address).to be_valid
      end
      it "phone_numberが空では登録できないこと" do
        @destination_shipping_address.phone_number= ''
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが12桁以上では登録できないこと" do
        @destination_shipping_address.phone_number= '090123456789'
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが英数字混合では登録できないこと" do
        @destination_shipping_address.phone_number= 'phone123456'
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @destination_shipping_address.token = nil
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @destination_shipping_address.item_id = ''
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @destination_shipping_address.user_id = ''
        @destination_shipping_address.valid?
        expect(@destination_shipping_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end     
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end  
  
    context '商品が出品できる時' do
      it '全て入力があれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない時' do  
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
     end
     it 'category_idが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it 'status_idが空だと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
     end
     it 'cost_idが空だと登録できない' do
        @item.cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
     end
     it 'day_idが空だと登録できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
     end
     it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
     end
     it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
     end  
     it 'priceが299円以下は登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
     end
     it 'priceが10,000,000円以上は登録できない' do
        @item.price = 50_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
     end
     it 'priceが全角だと登録できない' do
        @item.price = 'ゼンカク'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
     end
     it 'priceが英字だと登録できない' do
        @item.price = 'ABC'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
     end  
     it 'priceが英数字混合だと登録できない' do
        @item.price = 'ABC012'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
     end  
     it 'category_idに「---」が表示されていると登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
     end  
     it 'status_idに「---」が表示されていると登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
     end  
     it 'cost_idに「---」が表示されていると登録できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be other than 1")
     end  
     it 'day_idに「---」が表示されていると登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
     end  
     it 'prefecture_idに「---」が表示されていると登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
     end  
   end
  end   
end
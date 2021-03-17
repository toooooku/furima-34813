require 'rails_helper'

RSpec.describe User, type: :model do 
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザーが登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録ができない時' do  
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がない場合登録できない' do
        @user.email = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end  
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英語のみの場合登録できない' do
        @user.password = 'english'
        @user.password_confirmation = 'english'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
      end
      it 'passwordが数字のみの場合登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
      end
      it 'passwordが全角の場合登録できない' do
        @user.password = 'ゼンカク'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end  
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end    
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank") 
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end     
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'family_name,first_nameは全角での入力(漢字)がない場合は登録できない' do
        @user.family_name = 'yamada'
        @user.first_name= 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.", "First name is invalid. Input full-width characters.")
      end
      it 'family_name,first_nameは全角での入力(ひらがな)がない場合は登録できない' do
        @user.family_name = 'yamada'
        @user.first_name= 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.", "First name is invalid. Input full-width characters.")
      end
      it 'family_name,first_nameは全角での入力(カタカナ)がない場合は登録できない' do
        @user.family_name = 'yamada'
        @user.first_name= 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.", "First name is invalid. Input full-width characters.")
      end
      it 'family_name_kana,first_name_kanaは全角での入力(カタカナ)がない場合は登録できない' do
        @user.family_name_kana = 'やまだ'
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.", "First name kana is invalid. Input full-width katakana characters.")
      end 
    end  
  end
end  

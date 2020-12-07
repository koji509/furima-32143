require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "すべて正しいフォーマットで入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")    
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")    
      end
      it "emailに@が含まれていない場合登録できない" do
        @user.email = "testexample.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end    
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英字のみの場合登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角数字のみの場合登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ppasswordが全角英数字の場合登録できない" do
        @user.password = "ＡＡＡ１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aa000"
        @user.password_confirmation = "aa000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが一致していない場合は登録できない" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空の場合登録できない" do
        @user.first_name = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空の場合登録できない" do
        @user.last_name = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_kanaが空の場合登録できない" do
        @user.first_name_kana = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空の場合登録できない" do
        @user.last_name_kana = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaは半角カナでは登録できない" do
        @user.first_name_kana = "ﾃｽﾄ"
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana full-width katakana characters")
      end
      it "last_name_kanaは半角カナでは登録できない" do
        @user.last_name_kana = "ﾃｽﾄ"
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana full-width katakana characters")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
        @user.first_name = "AAAAA"
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name full-width characters")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
        @user.last_name = "AAAAA"
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name full-width characters")
      end
      it "birthdayが空の場合登録できない" do
        @user.birthday = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

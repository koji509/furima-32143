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
  end

  describe 'ユーザー新規登録' do
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
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email @ is not enough")
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
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "aa000"
      @user.password_confirmation = "aa000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
  end
end

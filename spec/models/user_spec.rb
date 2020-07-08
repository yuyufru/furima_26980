require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmation,first_name,:last_name,:last_name_kana,:first_name_kana,:birth_dayが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation,first_name,:last_name,:last_name_kana,:first_name_kana,:birth_day" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 6. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 7. passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    # 8. passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end


    #9. passwordが半角英数時混合以外であれば登録できないこと
    it 'is invalid without a password except mixed with half-width alphanumeric characters' do
      user = build(:user, password: '000000')
      user.valid?
      expect(user.errors[:password]).to include("半角英数字混合で入力してください。")
    end

    #10. last_name_kanaがカタカナでないと登録できないこと
    describe '#katakana' do
    it 'last_name_kanaがカタカナで返ること' do
      user = build(:user, last_name_kana: "kana")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("はカタカナで入力してください")
    endユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
    end
    end

    #11.ユーザー本名のフリガナは全角（カタカナ）で入力させること
    it 'first_name_kanaがカタカナで返ること' do
      user = build(:user, first_name_kana: "kana")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("はカタカナで入力してください")
  end
end
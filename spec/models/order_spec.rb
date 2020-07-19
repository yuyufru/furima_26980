require 'rails_helper'

describe User do
  describe '#create' do
    before do
      user = FactoryBot.build(:user)
    end

    # 1. post_codeが空では登録できないこと
    it "is invalid without a post_code" do
      user.post_code = ""
      user.valid?
      expect(user.errors[:post_code]).to include("can't be blank")
    end

    # 2. prefectureが空では登録できないこと
    it "is invalid without a prefecture" do
      user.prefecture = ""
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end

    # 3. cityが空では登録できないこと
    it "is invalid without a city" do
      user.city = ""
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    # 4. house_numberが空では登録できないこと
    it "is invalid without a city" do
      user.house_number = ""
      user.valid?
      expect(user.errors[:house_number]).to include("can't be blank")
    end

    # 5. phone_numberが11桁以内でなければ登録できないこと
    it "is invalid with a phone_number that has maximum than 11 characters " do
      user = build(:user, phone_number: "00000000000", phone_number: "00000000000")
      user.valid?
      expect(user.errors[:phone_number]).to include("is too short (maximum is 11 characters)")
    end
    
    # 6. tokenが空では登録できないこと
    it "is invalid without a city" do
      user.tokenr = ""
      user.valid?
      expect(user.errors[:token]).to include("can't be blank")
    end
end

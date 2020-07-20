
describe Item do
  describe '#create' do

    # 1. imageが空では登録できないこと
    it "is invalid without a image" do
      user = build(:item, image: nil)
      user.valid?
      expect(user.errors[:item]).to include("can't be blank")
    end
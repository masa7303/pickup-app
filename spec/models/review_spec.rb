require 'rails_helper'

RSpec.describe Review, type: :model do

  describe "Factories" do
    # 有効なファクトリを持つ
    it "is valid with valid factory" do
      create(:user)
      create(:shop)
      expect(build(:review)).to be_valid
    end
  end

  describe "Validations" do
    # 名前がなければ無効
    it { is_expected.to validate_presence_of(:title) }
  end
end

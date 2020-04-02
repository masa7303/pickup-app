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
end

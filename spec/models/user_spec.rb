require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#age' do
    context '20年前の生年月日の場合' do
      let(:user) { build(:user, birthday: 20.years.ago) }
      it '20歳であること' do
        expect(user.age).to eq(20)
      end
    end
  end
end

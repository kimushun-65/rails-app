require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#age' do
    before do
      allow(Time.zone).to receive(:now).and_return(Time.zone.parse('2025-01-01 00:00:00'))
    end


    context '20年前の生年月日の場合' do
      let(:user) { build(:user, birthday: 20.years.ago) }
      it '20歳であること' do
        expect(user.age).to eq(20)
      end
    end

    context '19年前の生年月日の場合' do
      let(:user) { build(:user, birthday: 19.years.ago) }
      it '19歳であること' do
        expect(user.age).to eq(19)
      end
    end

    context '18年前の生年月日の場合' do
      let(:user) { build(:user, birthday: 18.years.ago) }
      it '18歳であること' do
        expect(user.age).to eq(18)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  context 'Validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should validate_uniqueness_of :email }
  end

  context 'Relationships' do
    it { should have_many :user_favorites }
    it { should have_many(:favorites).through(:user_favorites) }
  end

  context 'Instance Methods' do
    context '#to_s' do
      it 'should return user\'s full name' do
        user = create(:user, first_name: 'Mike', last_name: 'McKee')
        expect(user.to_s).to eq(user.first_name + ' ' + user.last_name)
      end
    end

    context '#active_favorite?(geo_id)' do
      it 'returns true if user currently has this geo ID as a favorite' do
        user = create(:user)
        favorite1, favorite2 = create_list(:favorite, 2)

        user.set_favorite(favorite1)

        expect(user.active_favorite?(favorite1.geo_id)).to be_truthy
        expect(user.active_favorite?(favorite2.geo_id)).to be_falsey
      end
    end

    context '#set_favorite(favorite)' do
      it 'should add a favorite' do
        user = create(:user)
        favorite = create(:favorite)

        user.set_favorite(favorite)

        expect(user.favorites).to eq [favorite]
      end

      it 'will not add a favorite twice' do
        user = create(:user)
        favorite = create(:favorite)

        user.set_favorite(favorite)

        expect(user.favorites.count).to eq 1

        user.set_favorite(favorite)

        expect(user.favorites.count).to eq 1
      end
    end

    context '#deactivate_favorite(favorite)' do
      it 'should deactivate a favorite' do
        user = create(:user)
        favorite = create(:favorite)

        user.set_favorite(favorite)

        expect(user.favorites.count).to eq 1

        user.deactivate_favorite(favorite)

        expect(user.favorites.count).to eq 0
      end
    end
  end
end

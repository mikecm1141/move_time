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
    it { should have_many :favorites }
  end

  context 'Instance Methods' do
    context '#to_s' do
      it 'should return user\'s full name' do
        user = create(:user, first_name: 'Mike', last_name: 'McKee')
        expect(user.to_s).to eq(user.first_name + ' ' + user.last_name)
      end
    end
  end
end

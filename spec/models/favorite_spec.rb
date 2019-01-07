# frozen_string_literal: true

require 'rails_helper'

describe Favorite, type: :model do
  context 'Relationships' do
    it { should have_many :user_favorites }
    it { should have_many(:users).through(:user_favorites) }
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe UserFavorite, type: :model do
  context 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :favorite }
  end
end

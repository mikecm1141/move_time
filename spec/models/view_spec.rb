# frozen_string_literal: true

require 'rails_helper'

describe View, type: :model do
  context 'Relationships' do
    it { should belong_to :user }
  end

  context 'Instance Methods' do
    context '#name' do
      it 'returns the name of the view GEO id' do
        user = create(:user)
        view = create(:view, geo_id: '16000US0644000', user: user)

        expect(view.name).to eq 'Los Angeles, CA'
      end
    end

    context '#slug' do
      it 'returns the URL slug for that city' do
        user = create(:user)
        view = create(:view, geo_id: '16000US0644000', user: user)

        expect(view.slug).to eq 'los-angeles-ca'
      end
    end
  end
end

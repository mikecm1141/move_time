# frozen_string_literal: true

require 'rails_helper'

describe 'City Search Result' do
  subject { CitySearchResult.new('Denver') }

  it 'exists' do
    expect(subject).to be_a(CitySearchResult)
  end

  context 'Instance Methods' do
    context '#cities' do
      it 'returns a collection of city result item objects' do
        expect(subject.cities).to be_a(Array)
        expect(subject.cities[0]).to be_a(CitySearchItem)
      end
    end

    context '#count' do
      it 'returns total number of cities in the result' do
        expect(subject.count).to eq 14
      end
    end
  end
end

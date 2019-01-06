# frozen_string_literal: true

require 'rails_helper'

describe 'City Search Item' do
  subject {
    CitySearchItem.new(
      matching_full_name: 'Denver, Colorado, United States',
      '_links': {
        'city:item': {
          href: 'https://api.teleport.org/api/cities/geonameid:5419384/'
        }
      }
    )
  }

  it 'exists with standard attributes' do
    expect(subject).to be_a(CitySearchItem)
    expect(subject.name).to eq 'Denver, Colorado, United States'
  end

  context 'Instance Methods' do
    context '#id' do
      it 'returns the Teleport geo ID for that city' do
        expect(subject.id).to eq '5419384'
      end
    end
  end
end

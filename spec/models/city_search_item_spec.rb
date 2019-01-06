# frozen_string_literal: true

require 'rails_helper'

describe 'City Search Item' do
  subject {
    CitySearchItem.new(
      id: '23953939',
      display: 'Denver, CO',
      url_name: 'denver-co'
    )
  }

  it 'exists with standard attributes' do
    expect(subject).to be_a(CitySearchItem)
    expect(subject.id).to eq '23953939'
    expect(subject.name).to eq 'Denver, CO'
    expect(subject.slug).to eq 'denver-co'
  end
end

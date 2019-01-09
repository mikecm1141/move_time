# frozen_string_literal: true

require 'rails_helper'

describe 'Google Service' do
  subject { GoogleService.new }

  it 'exists' do
    expect(subject).to be_a(GoogleService)
  end

  context 'Instance Methods' do
    context '#city_results(query)' do
      it 'returns a JSON response of city results' do
        results = subject.lat_long('Denver, CO')

        expect(results).to be_a(Hash)
      end
    end
  end
end

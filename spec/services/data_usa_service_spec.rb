# frozen_string_literal: true

require 'rails_helper'

describe 'Data USA Service' do
  subject { DataUsaService.new }

  it 'exists' do
    expect(subject).to be_a(DataUsaService)
  end

  context 'Instance Methods' do
    context '#lat_long(city)' do
      it 'returns a JSON response of lat long results' do
        results = subject.city_results('Denver')

        expect(results).to be_a(Hash)
      end
    end
  end
end

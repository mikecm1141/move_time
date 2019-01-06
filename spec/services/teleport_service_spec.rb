# frozen_string_literal: true

require 'rails_helper'

describe 'Teleport Service' do
  subject { TeleportService.new }

  it 'exists' do
    expect(subject).to be_a(TeleportService)
  end

  context 'Instance Methods' do
    context '#city_results(query)' do
      it 'returns a JSON response of city results' do
        results = subject.city_results('Denver')

        expect(results).to be_a(Hash)
        expect(results).to have_key(:_embedded)
        expect(results[:_embedded]).to have_key(:'city:search-results')
        expect(results).to have_key(:count)
      end
    end
  end
end

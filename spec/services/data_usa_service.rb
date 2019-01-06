# frozen_string_literal: true

require 'rails_helper'

describe 'Data USA Service' do
  subject { DataUsaService.new }

  it 'exists' do
    expect(subject).to be_a(DataUsaService)
  end

  context 'Instance Methods' do
    context '#city_results(query)' do
      it 'returns a JSON response of city results' do
        results = subject.city_results('Denver')

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results).to have_key(:headers)
      end
    end
  end
end

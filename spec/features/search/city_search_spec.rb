# frozen_string_literal: true

require 'rails_helper'

describe 'City Search' do
  context 'user inputs city in search bar' do
    it 'returns a list of possible matches' do
      visit root_path

      fill_in :q, with: 'Denver'
      click_on 'Search'

      expect(current_path).to eq search_path
      expect(page).to have_content 'Results: 3'
      expect(page).to have_content 'Denver, Colorado, United States'
      expect(page).to have_content 'Danvers, Massachusetts, United States'
      expect(page).to have_content 'Denver, Pennsylvania, United States'
    end
  end
end

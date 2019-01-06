# frozen_string_literal: true

require 'rails_helper'

describe 'City Search' do
  context 'user inputs city in search bar' do
    it 'returns a list of possible matches' do
      visit root_path

      fill_in :q, with: 'Denver'
      click_on 'Search'

      expect(current_path).to eq search_path
      expect(page).to have_content 'Search Results for Denver'
      expect(page).to have_content 'Results: 7'
      expect(page).to have_content 'Denver, CO'
      expect(page).to have_content 'Denver, PA'
      expect(page).to have_content 'Denver, MO'
    end
  end
end

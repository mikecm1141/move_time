# frozen_string_literal: true

require 'rails_helper'

describe 'City Show Page' do
  context 'User views city show page' do
    before(:each) do
      visit root_path

      fill_in :q, with: 'Denver'
      click_on 'Search'

      click_on 'Denver, CO'
    end

    it 'shows basic data about that city' do
      expect(page).to have_content 'Denver'
      expect(page).to have_content 'Population Rank'
      expect(page).to have_content 'Median Age'
      expect(page).to have_content 'Income Rank'
      expect(page).to have_content 'Median Property Value'
    end
  end
end

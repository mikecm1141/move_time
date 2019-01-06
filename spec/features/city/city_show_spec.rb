# frozen_string_literal: true

require 'rails_helper'

describe 'City Show Page' do
  context 'User views city show page' do
    it 'shows available data about that city' do
      visit root_path

      fill_in :q, with: 'Denver'
      click_on 'Search'

      click_on 'Denver, Colorado, United States'

      expect(current_path).to eq '/city/5419384'
      expect(page).to have_content 'Denver'
      expect(page).to have_content 'Population: 682545'
    end
  end
end

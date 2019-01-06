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
      expect(page).to have_content 'Data Year'
      expect(page).to have_content 'Population'
      expect(page).to have_content 'Median Age'
      expect(page).to have_content 'Mean Commute Time'
      expect(page).to have_content 'Median Household Income'
      expect(page).to have_content 'Median Property Value'
      expect(page).to have_content 'Population Ranking'
      expect(page).to have_content 'Income Ranking'
    end

    it 'shows transportation data about that city' do
      expect(page).to have_content 'Bicycle'
      expect(page).to have_content 'Carpool'
      expect(page).to have_content 'Alone'
      expect(page).to have_content 'Motorcycle'
      expect(page).to have_content 'Public Transportation'
      expect(page).to have_content 'Taxi'
      expect(page).to have_content 'Walking'
      expect(page).to have_content 'Work From Home'
      expect(page).to have_content 'Total Workers'
    end

    it 'shows ethnicity data about that city' do
      expect(page).to have_content 'Native American/Alaskan Native'
      expect(page).to have_content 'Black'
      expect(page).to have_content 'White'
      expect(page).to have_content 'Asian'
      expect(page).to have_content 'Hawaiian/Pacific Islander'
      expect(page).to have_content 'Other/Unknown'
      expect(page).to have_content '2 or More'
      expect(page).to have_content 'Latino'
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe 'Favorites' do
  context 'User adds favorite city through city show page' do
    it 'allows user to favorite a location' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(user)

      visit root_path

      fill_in :q, with: 'Denver'
      click_on 'Search'

      click_link 'Denver, CO'

      click_on 'Add to Favorites'
    end
  end
end

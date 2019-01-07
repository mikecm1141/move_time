# frozen_string_literal: true

require 'rails_helper'

describe 'Favorites' do
  context 'User views dashboard' do
    it 'shows user their active favorites' do
      user = create(:user)
      favorite1 = create(:favorite, geo_id: '16000US0820000', user: user)
      favorite2 = create(:favorite, geo_id: '16000US4218888', user: user)
      favorite3 = create(:favorite, geo_id: '16000US3717000', user: user, active: false)

      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(user)

      visit dashboard_path

      expect(page).to have_content "Welcome #{user}"

      expect(page).to have_content 'Active Favorites: 2'
      expect(page).to have_selector('.favorites', count: 2)
    end
  end
end

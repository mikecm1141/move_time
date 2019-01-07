# frozen_string_literal: true

require 'rails_helper'

describe 'Favorites' do
  context 'User views dashboard' do
    it 'shows user their active favorites' do
      user = create(:user)
      favorite1 = create(:favorite, geo_id: '16000US0820000')
      favorite2 = create(:favorite, geo_id: '16000US4218888')
      favorite3 = create(:favorite, geo_id: '16000US3717000')

      user.set_favorite(favorite1)
      user.set_favorite(favorite2)
      user.set_favorite(favorite3)
      user.deactivate_favorite(favorite3)

      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(user)

      visit dashboard_path

      expect(page).to have_content "Welcome #{user}"

      expect(page).to have_content 'Active Favorites: 2'
      expect(page).to have_selector('.favorites', count: 2)
    end
  end
end

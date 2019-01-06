# frozen_string_literal: true

require 'rails_helper'

describe 'Users' do
  context 'Dashboard' do
    it 'should not allow non-signed in user to view a dashboard' do
      visit dashboard_path

      expect(current_path).to eq root_path
      expect(page).to have_content 'You must be signed in for that action'
    end

    it 'should only allow user to view their dashboard' do
      user1, user2 = create_list(:user, 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user)
        .and_return(user1)

      visit dashboard_path

      expect(page).to have_content user1.to_s
      expect(page).to_not have_content user2.to_s
    end
  end
end

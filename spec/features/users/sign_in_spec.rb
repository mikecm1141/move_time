# frozen_string_literal: true

require 'rails_helper'

describe 'Users' do
  context 'Signing In - Valid' do
    it 'should allow user to sign in' do
      user = create(:user, password: 'test', password_confirmation: 'test')

      visit root_path

      click_on 'Sign In'

      fill_in :login_email, with: user.email
      fill_in :login_password, with: user.password
      click_button 'Sign In'

      expect(current_path).to eq dashboard_path
      expect(page).to have_content 'Successfully logged in'
      expect(page).to have_content "Welcome #{user.to_s}"
    end
  end
end

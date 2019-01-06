# frozen_string_literal: true

require 'rails_helper'

describe 'Sessions' do
  before(:each) do
    @user = create(:user, password: 'test', password_confirmation: 'test')
  end

  context 'Signing In - Valid' do
    it 'should allow user to sign in' do
      visit root_path

      click_on 'Sign In'

      fill_in :login_email, with: @user.email
      fill_in :login_password, with: @user.password
      click_button 'Sign In'

      expect(current_path).to eq dashboard_path
      expect(page).to have_content 'Successfully signed in'
      expect(page).to have_content "Welcome #{@user.to_s}"
    end
  end

  context 'Signing In - Invalid' do
    it 'should error out when signing in with invalid credentials' do
      visit login_path

      fill_in :login_email, with: 'doesnotexist@nope.com'
      fill_in :login_password, with: 'bad_pass'
      click_button 'Sign In'

      expect(current_path).to eq login_path
      expect(page).to have_content 'Invalid email or password'
    end
  end

  context 'Signing Out - Valid' do
    it 'should allow a signed in user to sign out' do
      allow_any_instance_of(ApplicationController).to receive(:current_user)
                                                  .and_return(@user)

      visit dashboard_path

      expect(page).to have_content "Welcome #{@user.to_s}"

      click_on 'Sign Out'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Successfully signed out'
    end
  end
end

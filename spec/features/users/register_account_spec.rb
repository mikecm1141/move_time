# frozen_string_literal: true

require 'rails_helper'

describe 'Users' do
  context 'Account Registration - Valid' do
    it 'allows user to register an account' do
      visit root_path

      click_on 'Sign Up'

      expect(current_path).to eq register_path

      fill_in :user_first_name, with: 'Mike'
      fill_in :user_last_name, with: 'McKee'
      fill_in :user_email, with: 'mikecm@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Create Account'

      expect(current_path).to eq dashboard_path
      expect(page).to have_content 'Welcome Mike McKee'
      expect(page).to have_content 'Log Out'
      expect(page).to_not have_content 'Sign Up'
    end
  end

  context 'Account Registration - Invalid' do
    it 'denies account creation if passwords do not match' do
      visit register_path

      fill_in :user_first_name, with: 'Mike'
      fill_in :user_last_name, with: 'McKee'
      fill_in :user_email, with: 'mikecm@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password_no_match'
      click_on 'Create Account'

      expect(current_path).to eq register_path
      expect(page).to have_content(
        'Password confirmation doesn\'t match Password'
                                  )
    end
  end
end

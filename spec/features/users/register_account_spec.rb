require 'rails_helper'

describe 'Users' do
  context 'Account Registration' do
    it 'allows user to register an account' do
      visit root_path

      click_on 'Sign Up'

      expect(current_path).to eq new_user_path

      fill_in :user_first_name, with: 'Mike'
      fill_in :user_last_name, with: 'McKee'
      fill_in :user_email, with: 'mikecm@gmail.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password_confirmation'
      click_on 'Create Account'

      expect(current_path).to eq dashboard_path
      expect(page).to have_content 'Welcome Mike McKee'
      expect(page).to have_content 'Log Out'
      expect(page).to_not have_content 'Sign Up'
    end
  end
end

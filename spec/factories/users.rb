FactoryBot.define do
  factory :user do
    first_name            { 'First' }
    last_name             { 'Last' }
    email                 { 'test@test.com' }
    password              { 'test_pass' }
    password_confirmation { 'test_pass' }
  end
end

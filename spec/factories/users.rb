# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name)  { |n| "Last #{n}" }
    sequence(:email)      { |n| "test#{n}@test.com" }
    password              { 'test_pass' }
    password_confirmation { 'test_pass' }
  end
end

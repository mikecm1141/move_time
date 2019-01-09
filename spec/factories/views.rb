# frozen_string_literal: true

FactoryBot.define do
  factory :view do
    sequence(:geo_id) { |n| "1600USA93395SJS#{n}" }
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe View, type: :model do
  context 'Relationships' do
    it { should belong_to :user }
  end
end

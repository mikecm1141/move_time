# frozen_string_literal: true

# Class for the Welcome pages controller
class WelcomeController < ApplicationController
  def index
    @views = View.limit(10).order(updated_at: :desc)
    @favorites = Favorite.limit(10).order(updated_at: :desc)
  end
end

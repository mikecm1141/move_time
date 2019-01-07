# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :first_name,
            :last_name,
            :email,
            :password,
            :password_confirmation,
            presence: true

  validates :email, uniqueness: true

  has_many :user_favorites
  has_many :favorites, through: :user_favorites

  def to_s
    first_name + ' ' + last_name
  end

  def active_favorite?(geo_id)
    user_favorites
      .find_by_favorite_id(Favorite.find_by_geo_id(geo_id)&.id)&.active?
  end

  def set_favorite(favorite)
    if user_favorites.exists?(favorite_id: favorite.id)
      user_fav = user_favorites.find_by_favorite_id(favorite.id)
      user_fav.update(active: true)
    else
      favorites << favorite
    end
  end

  def deactivate_favorite(favorite)
    user_favorites.find_by_favorite_id(favorite.id).update(active: false)
  end
end

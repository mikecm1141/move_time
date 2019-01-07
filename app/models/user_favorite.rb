class UserFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorite

  default_scope { where(active: true) }
end

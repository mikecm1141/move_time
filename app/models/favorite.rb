class Favorite < ApplicationRecord
  include Informational

  belongs_to :user

  default_scope { where(active: true) }

  def name
    external_data[:display_name]
  end

  def slug
    external_data[:url_name]
  end
end

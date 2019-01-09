class View < ApplicationRecord
  include Informational

  belongs_to :user

  def name
    external_data[:display_name]
  end

  def slug
    external_data[:url_name]
  end
end

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

  def to_s
    first_name + ' ' + last_name
  end
end

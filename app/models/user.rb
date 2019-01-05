class User < ApplicationRecord
  has_secure_password

  validates :first_name,
            :last_name,
            :email,
            :password,
            :password_confirmation,
            presence: true
end

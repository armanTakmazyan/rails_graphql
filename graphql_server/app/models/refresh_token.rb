class RefreshToken < ApplicationRecord
  belongs_to :user, validate: true
end

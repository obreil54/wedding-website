class Guest < ApplicationRecord
  has_one :rsvp, dependent: :destroy
end

class Rsvp < ApplicationRecord
  belongs_to :guest

  validates :guest_id, presence: { message: "Please select your name from the list" }, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, if: :attending?
  validates :attending, inclusion: { in: [ true, false ] }

  validate :at_least_one_event_selected?, if: :attending?

  private

  def at_least_one_event_selected?
    unless event_1_attending || event_2_attending || event_3_attending
      errors.add(:base, "Please select at least one event if you are attending.")
    end
  end
end

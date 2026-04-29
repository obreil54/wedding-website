class Rsvp < ApplicationRecord
  belongs_to :guest

  before_validation :normalise_fields

  validates :guest_id,
    presence: { message: "Please select your name from the list" },
    uniqueness: true
  validates :email,
    presence: true,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    if: :attending?

  validates :attending,
    inclusion: { in: [ true, false ] }

  validate :at_least_one_event_selected?, if: :attending?

  private

  def normalise_fields
    if attending?
      self.notes = nil
    else
      self.event_1_attending = false
      self.event_2_attending = false
      self.event_3_attending = false
      self.dietary_requirements = nil
      self.email = nil
    end
  end

  def at_least_one_event_selected?
    unless event_1_attending || event_2_attending || event_3_attending
      errors.add(:base, "Please select at least one event if you are attending.")
    end
  end
end

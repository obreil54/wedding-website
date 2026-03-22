class Rsvp < ApplicationRecord
  belongs_to :guest

  validates :guest_id, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :attending, inclusion: { in: [ true, false ] }

  validate :event_selection_matches_attendance

  private

  def event_selection_matches_attendance
    selected_events = [
      event_1_attending,
      event_2_attending,
      event_3_attending
    ].count(true)

    if attending == true && selected_events == 0
      errors.add(:base, "Please select at least one event if you are attending.")
    elsif attending == false && selected_events > 0
      errors.add(:base, "Cannot select event if you are not attending.")
    end
  end
end

class RsvpsController < ApplicationController
  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      redirect_to success_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @rsvps = Rsvp.all
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(
      :guest_id,
      :email,
      :attending,
      :event_1_attending,
      :event_2_attending,
      :event_3_attending,
      :dietary_requirements,
      :notes
    )
  end
end

class RsvpsController < ApplicationController
  def new
    @rsvp = Rsvp.new
    @guests= Guest.order(:full_name)
  end

  def create
    @guests= Guest.order(:full_name)

    @rsvp = Rsvp.find_or_initialize_by(guest_id: rsvp_params[:guest_id])
    @rsvp.assign_attributes(rsvp_params)

    if @rsvp.save
      redirect_to success_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @rsvps = Rsvp.includes(:guest).order(created_at: :desc)
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

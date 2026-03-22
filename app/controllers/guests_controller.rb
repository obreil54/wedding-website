class GuestsController < ApplicationController
  def search
    q = params[:q]

    guests = if q.blank?
      Guest.none
    else
      Guest.where("lower(full_name) like ?", "%#{Guest.sanitize_sql_like(q)}%)")
        .order(:full_name)
        .limit(10)
    end

    render json: guests.select(:id, :full_name)
  end
end

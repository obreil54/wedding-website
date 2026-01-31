class PagesController < ApplicationController
  skip_before_action :require_site_password, only: %i[welcome unlock]
  def home
  end

  def travel
  end

  def faq
  end

  def welcome
  end

  def unlock
    if params[:password].to_s == ENV.fetch("SITE_PASSWORD", "")
      session[:site_unlocked] = true
      redirect_to root_path
    else
      flash.now[:alert] = "Incorrect password"
      render :welcome, status: :unauthorized
    end
  end

  def  event
  end
end

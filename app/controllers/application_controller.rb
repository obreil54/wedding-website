class ApplicationController < ActionController::Base
  before_action :require_site_password

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def require_site_password
    return if session[:site_unlocked] == true
    return if controller_name == "pages" && action_name.in?(%w[welcome unlock])

    redirect_to welcome_path
  end
end

class ApplicationController < ActionController::Base
  protected
  def authorized_admin!
    redirect_to root_path if !current_user&.admin?
  end
end

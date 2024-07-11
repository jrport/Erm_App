class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(_resource)
    current_user.admin? ? home_path : lojistas_path
  end

  def user_admin?
    redirect_to lojistas_path unless current_user.admin?
  end
end

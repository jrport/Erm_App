class HomeController < ApplicationController
  before_action :user_admin?
  def index
  end
end

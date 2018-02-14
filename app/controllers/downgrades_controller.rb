class DowngradesController < ApplicationController
  def create
    flash[:notice] = "You have downgraded your account."
    current_user.standard!
    redirect_to root_path
  end
end

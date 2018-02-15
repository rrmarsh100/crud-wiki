class DowngradesController < ApplicationController
  def create
    flash[:notice] = "You have downgraded your account.  All of your wikis are now public."
    current_user.standard!
    current_user.wikis.update_all(:private => false)
    redirect_to wikis_path
  end
end

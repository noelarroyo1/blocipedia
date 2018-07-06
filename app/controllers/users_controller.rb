class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def downgrade
    current_user.update_attribute(:role, 'standard')
    current_user.expose_wikis
    flash[:notice] = "#{current_user.email} you're account has been downgraded"
    redirect_to wikis_path
  end
end

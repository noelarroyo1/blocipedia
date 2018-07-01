class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def downgrade
    @user = User.find(current_user.id)
    @wikis = current_user.wikis
    if @user == current_user
      @wikis.update_all(private: false)
      current_user.update_attribute(:role, 'standard')

      flash[:notice] = "#{current_user.email} you're account has been downgraded"
      redirect_to wikis_path
    end
  end
end

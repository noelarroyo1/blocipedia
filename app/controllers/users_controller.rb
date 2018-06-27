class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def downgrade
    if current_user.role == "premium"
      current_user.update_attribute(:role, 'standard')
      flash[:notice] = "Sorry you had to leave us #{current_user.email}"
      redirect_to user_path(current_user)
    end
  end
end

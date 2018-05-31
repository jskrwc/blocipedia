class UsersController < ApplicationController

  def downgrade
    @user = current_user
    current_user.update_attribute(:role, 'standard')

    flash[:notice] = "Your account has been downgraded from Premium to Standard."

    redirect_to edit_user_registration_path # back to profile
  end


end

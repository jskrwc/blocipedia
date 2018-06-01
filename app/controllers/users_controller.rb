class UsersController < ApplicationController

  def downgrade
    @user = current_user
    current_user.update_attribute(:role, 'standard')

    current_user.wikis.update_all(private: false)

    flash[:notice] = "Your account has been downgraded from Premium to Standard. Your private wikis are now public."

    redirect_to edit_user_registration_path # back to profile
  end


end

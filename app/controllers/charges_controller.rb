class ChargesController < ApplicationController

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Upgrade to Premium - #{current_user.email}",
      amount: Amount.default
    }
  end

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: Amount.default, # nb: needed to create a Amount class and default class method -- see model

      description: "Blocipedia Membership Upgrade - #{current_user.email}",
      currency: 'usd'
    )


    # add logic to upgrade here
    current_user.update_attribute(:role, 'premium')


    flash[:notice] = "Payment successful.  #{current_user.email} is now a Premium member."
    redirect_to edit_user_registration_path # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

end

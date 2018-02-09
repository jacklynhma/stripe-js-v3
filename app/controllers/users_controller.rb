class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def create

  end

  def refund
    byebug
    @charge_id = params[:charge_id]
    # if we are keeping record of charges we should undo it
    Stripe::Refund.create(
      charge: @charge_id
    )

    redirect_to users_path
  end
end

class TestsController < ApplicationController
  protect_from_forgery except: :index
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      # probably needs to be set in env
      Stripe.api_key = "sk_test_67VIDDWRpzE3Si7LeH3u4nD5"

      token = params[:stripeToken]
      # Charge the user's card:
        charge = Stripe::Charge.create(
          :amount => 100,
          :currency => "usd",
          :description => "Example charge",
          :source => token,
        )

      # render :index, cannot do this because it does not refresh the page
      redirect_to success_tests_path
    else
      # render error message
    end
  end

  def success
  end

  private

  def test_params
    params.permit(:stripeToken)
  end
end

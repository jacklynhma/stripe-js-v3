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
      customer = Stripe::Customer.create(
        email: "paying.user@example.com",
        source: token
      )

      User.create(name: "test", email: "paying.user@example.com", token: customer.id )
      # Charge the card:

        charge = Stripe::Charge.create(
          :amount => 100,
          :currency => "usd",
          :description => "Example charge",
          customer: "cus_CIE83tMfdgik4v"
        )

      # render :index, cannot do this because it does not refresh the page

      #create another charge later, you have to retrieve the customer

      redirect_to success_tests_path
    else
      # render error message
    end
  end

  def success
  end

  def charge
    Stripe.api_key = "sk_test_67VIDDWRpzE3Si7LeH3u4nD5"

    token = params[:stripeToken]


    charge = Stripe::Charge.create(
      amount: 1000,
      currency: "usd",
      customer: customer.id
    )
    redirect_to success_tests_path
  end

  private

  def test_params
    params.permit(:stripeToken)
  end
end

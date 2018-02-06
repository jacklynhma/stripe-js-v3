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
    byebug
    if @test.save
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

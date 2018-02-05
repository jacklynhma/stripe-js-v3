class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      # render :index, cannot do this because it does not refresh the page
      redirect_to tests_path
    else
      # render error message
    end
  end

  private

  def test_params
    params.require(:test).permit(:name)
  end
end

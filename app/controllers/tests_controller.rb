class TestsController < ApplicationController
  before_action :find_test, only: %i(edit update destroy)

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found


  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests
  end

    private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end

class QuestionsController < ApplicationController
  before_action :find_test, only: %i(index new create)
  before_action :find_question, only: %i(show destroy)

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @questions.inspect
  end

  def new
  end

  def create
    question = @test.questions.build(question_params)
    question.save
    redirect_to test_questions_url
  end

  def destroy
    @question.destroy
    redirect_to test_questions_url
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @questions = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_passage.time_remaning
    if @test_passage.completed?
      BadgeService.new(@test_passage).call
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result
      gist = current_user.gists.create(question_id: @test_passage.current_question_id, link: result.id)
      gist.save
      flash_type = { notice: t('gist.success', link: result.html_url) }
    else
      flash_type = { alert: t('gist.failure') }
    end

    redirect_to @test_passage, flash_type
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

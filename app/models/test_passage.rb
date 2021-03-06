class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :set_question

  scope :passed, -> { where ('result >= 85') }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.result = self.result_points
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_points
    (correct_questions * 100) / test.questions.size
  end

  def test_passed?
    result_points >= 85
  end

  def test_done?
    completed? && test_passed?
  end

  def time_left
    (expires_at - Time.current).to_i
  end

  def stop!
    self.current_question = nil
  end

  def time_over?
    expires_at < Time.current
  end

  def time_remaning
    if check_timer
      stop!
    else
      accept!(params[:answer_ids])
    end
  end

  private

  def check_timer
    test.timer_exists? && time_over?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    self.current_question.answers.correct
  end

  def set_question
    if self.current_question.nil?
      self.current_question = first_question
    else
      self.current_question = next_question
    end
    self.current_question_number += 1
  end

  def first_question
    test.questions.first
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def expires_at
    created_at + test.timer.minutes if test.timer_exists?
  end
end

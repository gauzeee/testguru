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

  private

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
end

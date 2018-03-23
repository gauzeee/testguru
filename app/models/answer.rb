class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :quantity

  scope :correct, -> { where(correct: true) }

  private

  def quantity
    errors.add(:question) if question.answers.size > 4
  end
end

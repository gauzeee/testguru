class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :quantity

  private

  def quantity
    errors.add(:question) if question.answers.size > 4
  end
end

class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :advanced, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :title_by_category, -> (category_title) {
    joins(:category).where(categories: { title: category_title }).
    order(title: :desc) }
  scope :passed, -> { joins(:test_passages).merge(TestPassage.passed).distinct }
  scope :by_level, -> (parameter) { levels =
                      { easy: 0..1, advanced: 2..4, hard: 5..Float::INFINITY }
                      where(level: levels[parameter.to_sym]) }
end

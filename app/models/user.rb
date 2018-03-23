class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  scope :tests_by_level, -> (level) { joins(:test_passages).
    where(user_id: :user_id, level: level) }

  validates :name, presence: true
  validates :email, presence: true
end

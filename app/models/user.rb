class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  def tests_by_level(level)
    Test.joins('JOIN test_passages
    ON tests.id = test_passages.test_id').
    where('test_passages.user_id = :user_id AND level = :level',
    user_id: id, level: level)
  end
end

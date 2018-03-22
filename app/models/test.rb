class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  def self.title_by_category(category_title)
    Test.joins('JOIN categories
    ON tests.category_id = categories.id').
    where(categories: { title: category_title }).
    order('tests.title DESC').pluck(:title)
  end
end

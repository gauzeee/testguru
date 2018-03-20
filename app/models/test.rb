class Test < ApplicationRecord
  def self.tests_by_category(cat)
    Test.joins('JOIN categories
    ON tests.category_id = categories.id').
    where(categories: { title: cat }).
    order('tests.title DESC')
  end
end

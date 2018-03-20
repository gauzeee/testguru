class User < ApplicationRecord
  def show_my_tests(level)
    Test.joins('JOIN test_passages
    ON tests.id = test_passages.test_id').
    where('test_passages.user_id = :user_id AND level = :level',
    user_id: id, level: level)
  end
end

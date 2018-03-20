class User < ApplicationRecord
  def show_my_tests(level)
    Test.joins('JOIN viewed_tests
    ON tests.id = viewed_tests.test_id').
    where('viewed_tests.user_id = :user_id AND level = :level',
    user_id: id, level: level)
  end
end

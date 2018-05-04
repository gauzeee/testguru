class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    get_badge if @test_passage.test_done?
  end

  def get_badge
    Badge.find_each do |badge|
      @user.badges << badge if self.send("#{badge.rule}?", badge.parameter) && no_badge?(badge)
    end
  end

  def no_badge?(badge)
    if badge.rule == 'first_try'
      true
    else
      !@user.badges.include?(badge)
    end
  end

  def first_try?(parameter)
    @user.tests.where(id: @test.id).count == 1
  end

  def user_passed_tests
    @passed_tests_ids ||= @user.test_passages.passed.pluck(:test_id).uniq
  end

  def all_on_level?(level)
    all_level_tests = Test.by_level(level).ids.uniq
    (all_level_tests - user_passed_tests).empty? if all_level_tests
  end

  def all_on_category?(category)
    all_category_tests = Test.title_by_category(category.capitalize).ids.uniq
    (all_category_tests - user_passed_tests).empty?
  end
end


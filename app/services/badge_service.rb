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
    Badge.all.each do |badge|
      case badge.rule
      when 'first_try'
        @user.badges << badge if first_try?
      when 'all_on_category_backend'
        @user.badges << badge if all_on_category_backend? && got_badge?(badge)
      when 'all_on_easy_level'
        @user.badges << badge if all_on_easy_level? && got_badge?(badge)
      when 'all_on_advanced_level'
        @user.badges << badge if all_on_advanced_level? && got_badge?(badge)
      end
    end
  end

  def got_badge?(badge)
    !@user.badges.include?(badge)
  end

  def first_try?
    @user.tests.where(id: @test.id).count == 1
  end

  def user_passed_tests
    @user.test_passages.passed.pluck(:test_id).uniq
  end

  def all_on_category_backend?
    all_backend_tests = Test.title_by_category('Backend').ids.uniq
    (all_backend_tests - user_passed_tests).empty?
  end

  def all_on_easy_level?
    all_easy_level_tests = Test.easy.ids.uniq
    (all_easy_level_tests - user_passed_tests).empty?
  end

  def all_on_advanced_level?
    all_advanced_level_tests = Test.advanced.ids.uniq
    (all_advanced_level_tests - user_passed_tests).empty?
  end

end


class Badge < ApplicationRecord
  BADGE_RULES = ['all_on_level', 'all_on_category', 'first_try'].freeze
  has_many :user_badges
  has_many :users, through: :user_badges

  def self.rules
    BADGE_RULES
  end
end

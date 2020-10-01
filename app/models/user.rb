class User < ApplicationRecord
  has_many :authors, through: :tests
  has_many :user_tests
  has_many :tests, through: :user_tests

  def tests_by_level(level)
    Test
      .joins("JOIN user_tests ON user_tests.test_id = tests.id")
      .where(user_tests: {user_id: self.id}, tests: {level: level})
  end
end

class User < ApplicationRecord
  has_many :created_tests, class_name:'Test', foreign_key: :author_id, dependent: :restrict_with_error
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  validates :name, :username, :password, :email, presence: true

  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end

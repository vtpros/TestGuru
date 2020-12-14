class User < ApplicationRecord

  has_many :created_tests, class_name:'Test', foreign_key: :author_id,
           dependent: :restrict_with_error
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end

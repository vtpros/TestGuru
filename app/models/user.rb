class User < ApplicationRecord
  has_many :created_tests, class_name:"Test", foreign_key: "author_id", dependent: :restrict_with_error
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  validates :name, :username, :password, :email, presence: true

  # doesn't seem possible to replace this with scope, since it's a class method
  def tests_by_level(level)
    tests.where(level: level)
  end
end

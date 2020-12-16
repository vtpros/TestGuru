class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test',
                           dependent: :restrict_with_error,
                           inverse_of: :author
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, :password, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end

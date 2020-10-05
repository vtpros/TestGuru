class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name:"User", foreign_key: "author_id"
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category,
        -> (name) do
          joins(:category)
            .where(categories: { name: name })
            .order(title: :desc)
            .pluck(:title)
        end

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validate :unique_title_by_level

  def unique_title_by_level
    if self.class.where(title: title, level: level).count.nonzero?
      errors.add(:title, "within same level should be unique")
    end
  end
end

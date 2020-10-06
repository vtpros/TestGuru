class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name:"User", foreign_key: "author_id"
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level,
     message: "within same level should be unique" }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :by_category,
        -> (name) do
          joins(:category)
            .where(categories: { name: name })
            .order(title: :desc)
        end

  def self.titles_by_category(name)
    by_category(name).pluck(:title)
  end

end

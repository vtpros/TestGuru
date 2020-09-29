class Test < ApplicationRecord
  # belongs_to :category

  def self.tests_by_category(name)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { name: name })
      .order(title: :desc)
      .pluck(:title)
  end
end

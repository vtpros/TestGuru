class Test < ApplicationRecord
  # belongs_to :category

  def self.tests_by_category(name)
    # I don't know how to 'return array of test titles'
    # without using .to_a and .map
    Test.joins("JOIN categories ON tests.category_id = categories.id")
    .where("categories.name = ?", name)
    .order(title: :desc)
    .to_a.map(&:title)
  end
end

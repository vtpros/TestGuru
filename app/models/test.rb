class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(name)
    category_id = Category.where(name: name).first.id
    tests = Test.order(title: :desc).where(category_id: category_id).to_a
    tests.map(&:title)
  end
end

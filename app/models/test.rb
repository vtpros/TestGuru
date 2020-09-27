class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(name)
    category_id = Category.where(name: name).first.id
    self.where(category_id: category_id).to_a
  end
end

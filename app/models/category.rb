class Category < ApplicationRecord
  default_scope { order(name: :asc) }

  has_many :tests, dependent: :destroy

  validates :name, presence: true

  def i18n_name
    I18n.t("categories.#{name}")
  end
end

class Category < ActiveRecord::Base

  has_many :items_categories
  has_many :items, -> { uniq }, through: :items_categories

  validates :name, presence: true, uniqueness: true
end

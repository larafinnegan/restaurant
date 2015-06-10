class Item < ActiveRecord::Base

  has_many :items_categories
  has_many :categories, -> { uniq }, through: :items_categories


  validate :decimal_places
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01, less_than_or_equal_to: 999.99 }
  validates :categories, length: { minimum: 1 }

  def decimal_places
    if price.to_s.split(".")[1] && price.to_s.split(".")[1].length > 2
      errors.add(:price, "Prices have a maximum of 2 decimal places.")
    end
  end
end
class Category < ActiveRecord::Base

  has_many :categorizations
  has_many :items, -> { uniq }, through: :categorizations

  validates :name, presence: true, uniqueness: true
end

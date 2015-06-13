class OrderDetail < ActiveRecord::Base

  belongs_to :item
  belongs_to :order
  
  validates :item, presence: true
  validates :order, presence: true
  before_save :validate_item_not_retired

def validate_item_not_retired
  errors.add(:item, "is not currently available to order") if item.retired 
end

end

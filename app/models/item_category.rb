class ItemCategory < ActiveRecord::Base

  belongs_to :Item
  belongs_to :patient
end

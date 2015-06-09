class AddPriceToItems < ActiveRecord::Migration
  def change
    add_column :items, :price, :decimal, precision: 5, scale: 2
  end
end

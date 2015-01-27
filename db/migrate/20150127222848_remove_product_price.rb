class RemoveProductPrice < ActiveRecord::Migration
  def change
  	remove_column(:products, :product_price, :int)
  	add_column(:products, :product_price, :float)
  end
end

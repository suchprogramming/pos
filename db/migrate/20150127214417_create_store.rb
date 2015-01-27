class CreateStore < ActiveRecord::Migration
  def change
  	create_table(:products) do |t|
  		t.column(:product_name, :string)
  		t.column(:product_price, :int)
  	end
  end
end

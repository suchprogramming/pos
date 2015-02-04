class FixProductCategories < ActiveRecord::Migration
  def change
    add_column(:products, :category_id, :int)
    remove_column(:products, :category, :string)
  end
end

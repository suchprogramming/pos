class Product < ActiveRecord::Base
  validates(:product_name, {:presence => true, :length => {:maximum => 30}})
  before_save(:titlecase_product_name)

  private

  define_method(:titlecase_product_name) do
    self.product_name=(product_name().titlecase())
  end
end

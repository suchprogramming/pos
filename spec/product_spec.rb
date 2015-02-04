require('spec_helper')

describe(Product) do

  it { should belong_to(:category) }

  it("runs titlecase method on the product name before saving") do
    test_product = Product.create({ :product_name => "random product" })
    expect(test_product.product_name()).to(eq("Random Product"))
  end

  it("validates name field") do
    test_product = Product.new({ :product_name => "" })
    expect(test_product.save()).to(eq(false))
  end
end

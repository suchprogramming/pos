require('spec_helper')

describe(Category) do

  it { should have_many(:products) }

  it("runs titlecase method on the category name before saving") do
    test_category = Category.create({ :name => "random category" })
    expect(test_category.name()).to(eq("Random Category"))
  end

  it("validates name field") do
    test_category = Category.new({ :name => "" })
    expect(test_category.save()).to(eq(false))
  end
end

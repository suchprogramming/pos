require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/product")
require("pg")

get('/') do
	@products = Product.all()
	erb(:index)
end

get('/manager') do
  @products = Product.all()
  erb(:manager)
end

post('/manager') do
  product_name = params.fetch('product_name')
  product_price = params.fetch('product_price')
  @product = Product.new({:product_name => product_name, :product_price => product_price})
  @product.save()
  @products = Product.all()
  erb(:manager)
end
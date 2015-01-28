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

delete('/manager/:id') do
  @products = Product.all()
  id = params.fetch("id").to_i()
  Product.find(id).delete()
  erb(:manager)
end

get("/manager/:id/edit") do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product_edit)
end

patch('/manager/:id') do
	@products = Product.all()
	product_name = params.fetch('product_name')
	product_price = params.fetch('product_price')
  id = params.fetch("id").to_i()
  @product = Product.find(id)
  @product.update({:product_name => product_name, :product_price => product_price})
  erb(:manager)
end

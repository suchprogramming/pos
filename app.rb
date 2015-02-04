require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @products = Product.all()
  erb(:index)
end

get('/manager') do
  @products = Product.all()
  @categories = Category.all()
  erb(:manager)
end

post('/manager') do
  product_name = params.fetch('product_name')
  product_price = params.fetch('product_price')
  category_id = params.fetch('category_id')
  @product = Product.create({:product_name => product_name, :product_price => product_price, :category_id => category_id})
  @categories = Category.all()
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

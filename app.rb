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
  redirect("/manager")
end

delete('/manager/:id') do
  id = params.fetch("id").to_i()
  Product.find(id).delete()
  redirect("/manager")
end

get("/manager/:id/edit") do
  @product = Product.find(params.fetch("id").to_i())
  @categories = Category.all()
  erb(:product_edit)
end

patch('/manager/:id') do
  product_name = params.fetch('product_name')
  product_price = params.fetch('product_price')
  category_id = params.fetch('category_id')
  id = params.fetch("id").to_i()
  @product = Product.find(id).update({:product_name => product_name, :product_price => product_price, :category_id => category_id})
  redirect("/manager")
end

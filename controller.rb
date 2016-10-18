require('sinatra')
require('sinatra/contrib/all')

require_relative('models/order')
require_relative('models/table_builder')

require('pry-byebug')

get '/orders/new' do
  erb(:orders_new)
end

post '/orders' do
  @order = Order.new( params )
  @order.save
  erb(:confirmation)
end

get '/orders' do
  @orders = Order.all()
  @total_quantity = Order.total_quantity()
  erb(:orders)
end

get '/table-builder-test' do
  orders_data = Order.all_data()
  @html = TableBuilder.build_table( orders_data, ["address", "quantity", "size"] )
  erb(:table_builder_test)
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( './models/pizza' )

get '/pizzas/' do
  redirect '/pizzas'
end

get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

get '/pizzas/new' do 
  erb(:new)
end

post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete()
  erb(:delete_order)
end

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update_confirmation)
end
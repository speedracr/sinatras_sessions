require       'sinatra'
require       'sinatra/activerecord'
require       'sinatra/reloader'
require_relative  './twittertools'
enable :sessions

set :server, 'webrick'
set :database, 'sqlite3:shopping.db'

class Question < ActiveRecord::Base
  validates :title, presence: true
end

get "/?" do
  session['test'] = 'Oh, hi there.'
  @questions = Question.all
  erb :"products/homepage"
end

get "/check" do
  @cookie = session['test']
  erb :"products/show"
end

###### create a new question #####
get "/new/?" do
  erb :"/products/new"
end

##### TO DO: add a random Homer Simpson avatar for the default img #####
## link to STXCH on ruby random http://stackoverflow.com/questions/198460/how-to-get-a-random-number-in-ruby ##
get "/create" do

end
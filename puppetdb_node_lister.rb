# encoding: US-ASCII
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'active_support/time_with_zone'
require 'awesome_print'
require 'date'
require 'pp'
require 'tilt/erb'
require 'time'

### local methods
require_relative 'lib/methods.rb'

config_file 'config/config.yml'

### minimal basic auth
use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == settings.username and
  password == settings.password
end

### request area
get '/' do
    erb :index
end

get '/inventory' do
  inventory = get_environment_nodes_from_inventory(params[:environment]).sort_by { |k| k['certname'] }
  nodes     = get_all_nodes_from_environment(params[:environment]).sort_by { |k| k['certname'] }
  erb :inventory, :locals => { inventory: inventory, nodes: nodes }
end

get '/info' do
  erb :info
end

get '/facts' do
  erb :facts
end


require 'rack/lobster'
require './thread-dumper'
require 'faye'

map '/health' do
  health = proc do |env|
    [200, { "Content-Type" => "text/html" }, ["1"]]
  end
  run health
end

map '/lobster' do
  run Rack::Lobster.new
end

Faye::WebSocket.load_adapter('thin')
app = Faye::RackAdapter.new(:mount => '/', :timeout => 45)
run app

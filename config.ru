require 'rack/lobster'
require 'faye'

map '/lobster' do
  run Rack::Lobster.new
end

Faye::WebSocket.load_adapter('thin')
app = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)
run app

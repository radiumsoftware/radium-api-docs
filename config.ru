require 'rack-rewrite'

use Rack::Rewrite do
  rewrite '/', '/index.html'
end

root = "#{Dir.pwd}/site"
run Rack::Directory.new("#{root}")

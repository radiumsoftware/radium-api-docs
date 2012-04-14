require 'bundler'
require 'api_guides'

task :generate do
  ApiGuides::Generator.new({
    :source_path => "#{File.dirname(__FILE__)}/source",
    :site_path => "#{File.dirname(__FILE__)}/site",
    :title => 'Radium API',
    :logo => "#{File.dirname(__FILE__)}/logo.png",
    :default => "ruby"
  }).generate
end

task :default => :generate

namespace :assets do
  task :precompile => 'generate' do
    # nothing
  end
end

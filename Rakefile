require 'bundler'
require 'fileutils'
require 'pathname'
require 'mustache'

class Layout < Mustache
  attr_accessor :title

  def stylesheet
    "stylesheets/syle.css"
  end
end

task :generate => [:clear_site, :make_empty_directory, :copy_assets] do
  source_path = Pathname.new(__FILE__).join('source')

  source_files = Dir[source_path.join('**/*.{md|markdown}')].sort
end

task :clear_site do
  site_path = File.expand_path 'site', __FILE__
  FileUtils.rm_rf site_path
end

task :make_empty_directory do
  site_path = File.expand_path 'site', __FILE__
  FileUtils.mkdir_p site_path
end

task :copy_assets do
  asset_path = Pathname.new File.expand_path('assets', __FILE__)
  site_path = Pathname.new File.expand_path('site', __FILE__)

  FileUtils.cp_r asset_path, site_path
end

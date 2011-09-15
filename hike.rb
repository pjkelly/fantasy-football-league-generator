require 'rubygems'
begin
  require 'terminal-table/import'
rescue LoadError
  puts "Please install the terminal-table gem."
end
require 'yaml'
require File.dirname(__FILE__) + '/lib/league'

league = League.new
league.build!
league.to_file

require 'rubygems'
require 'bundler/setup'

ROOT = Pathname(File.expand_path(File.join(File.dirname(__FILE__), '..')))
$LOAD_PATH << File.join(ROOT, 'lib')
$LOAD_PATH << File.join(ROOT, 'lib', 'geektool_kit')
require File.join(ROOT, 'lib', 'geektool_kit.rb')

Bundler.setup

RSpec.configure do |config|
  
  config.color = true
  config.formatter = :documentation # :progress, :html, :textmate
end


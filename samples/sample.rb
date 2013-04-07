#!/usr/bin/env ruby
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'rubygems'
require 'gyazz-markup'

if ARGV.empty?
  fname = File.expand_path 'sample.txt', File.dirname(__FILE__)
else
  fname = ARGV.shift
end

str = File.open(fname).read
gm = GyazzMarkup::Markup.new :host => 'http://gyazz.com', :wiki => 'test'

puts gm.markup str

require 'rubygems'
require 'nokogiri'

module TestXml
  VERSION = '0.0.1'
end

require File.dirname(__FILE__) + '/../lib/test_xml/matchers'
require File.dirname(__FILE__) + '/../lib/test_xml/nokogiri/node'
require File.dirname(__FILE__) + '/../lib/test_xml/nokogiri'

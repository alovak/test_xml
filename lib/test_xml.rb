require 'nokogiri'
require 'test_xml/nokogiri/node'
require 'test_xml/nokogiri'

module TestXml
  class << self
    attr_accessor :enable_placeholders

    def placeholders_enabled?
      !!enable_placeholders
    end
  end

end

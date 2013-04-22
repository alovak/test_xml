require 'test_xml'
require 'test_xml/test_unit/assertions'
require 'test_xml/matcher_methods'

TestXml::ASSERTIONS.each do |cfg|
  RSpec::Matchers.define cfg.matcher do |expected|
    match do |actual|
      TestXml::MatcherMethods.send(cfg.name, actual, expected)
    end

    failure_message_for_should do |actual|
      cfg.message_for_should.call(expected, actual)
    end

    failure_message_for_should_not do |actual|
      cfg.message_for_should_not.call(expected, actual)
    end
  end
end
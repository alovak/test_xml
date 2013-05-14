require "test_xml"

# TODO: should we remove test_xml/spec?
MiniTest::Expectations.class_eval do
  TestXml::ASSERTIONS.each do |cfg|
    infect_an_assertion(cfg.assert_name, cfg.expectation)
  end
end

class MiniTest::Test
  include TestXml::Assertions
end

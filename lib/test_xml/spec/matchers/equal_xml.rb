RSpec::Matchers.define :equal_xml do |expected|
  match do |actual|
    TestXml::MatcherMethods.xml_equal(actual, expected)
  end

  failure_message_for_should do |actual|
    "the xml:\n#{actual}\nshould exactly match xml:\n#{expected}"
  end

  failure_message_for_should_not do |actual|
    "the xml:\n#{actual}\nshould not exactly match xml:\n#{expected}\nbut it does"
  end
end

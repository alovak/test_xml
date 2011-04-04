RSpec::Matchers.define :contain_xml do |expected|
  match do |actual|
    TestXml::MatcherMethods.xml_contain(actual, expected)
  end

  failure_message_for_should do |actual|
    "the xml:\n#{actual}\nshould match xml:\n#{expected}"
  end

  failure_message_for_should_not do |actual|
    "the xml:\n#{actual}\nshould not match xml:\n#{expected}\nbut it does"
  end
end

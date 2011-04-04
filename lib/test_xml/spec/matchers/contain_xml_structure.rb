RSpec::Matchers.define :contain_xml_structure do |expected|
  match do |actual|
    TestXml::MatcherMethods.xml_structure_contain(actual, expected)
  end

  failure_message_for_should do |actual|
    "the xml:\n#{actual}\nshould match xml structure:\n#{expected}"
  end

  failure_message_for_should_not do |actual|
    "the xml:\n#{actual}\nshould not match xml structure:\n#{expected}\nbut it does"
  end
end

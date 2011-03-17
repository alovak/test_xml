RSpec::Matchers.define :exactly_match_xml do |expected|
  match do |actual|
    subject = Nokogiri::XML::Document.parse(actual)
    pattern = Nokogiri::XML::Document.parse(expected)

    compare_values = true

    subject.match?(pattern, compare_values) && pattern.match?(subject, compare_values)
  end

  failure_message_for_should do |actual|
    "the xml:\n#{actual}\nshould exactly match xml:\n#{expected}"
  end

  failure_message_for_should_not do |actual|
    "the xml:\n#{actual}\nshould not exactly match xml:\n#{expected}\nbut it does"
  end
end

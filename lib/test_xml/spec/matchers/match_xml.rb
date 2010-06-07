Spec::Matchers.define :match_xml do |expected|
  match do |actual|
    subject = Nokogiri::XML::Document.parse(actual)
    pattern = Nokogiri::XML::Document.parse(expected)

    compare_values = true

    subject.match?(pattern, compare_values)
  end

  failure_message_for_should do |actual|
    "the xml:\n#{actual}\nshould match xml:\n#{expected}"
  end

  failure_message_for_should_not do |actual|
    "the xml:\n#{actual}\nshould not match xml:\n#{expected}\nbut it does"
  end
end

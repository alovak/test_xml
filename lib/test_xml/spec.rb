require 'test_xml'

# Adds assertions to RSpec.
TestXml::ASSERTIONS.each do |cfg|
  RSpec::Matchers.define cfg.matcher do |expected|
    match do |actual|
      TestXml::MatcherMethods.send(cfg.name, actual, expected)
    end

    # RSpec 2 and 3 use different methods
    # to access failure messages.
    if RSpec::Expectations::Version::STRING[0] == "2"
      failure_message_for_should { |actual| cfg.message.call(actual, expected) }
      failure_message_for_should_not { |actual| cfg.message_when_negated.call(actual, expected) }
    else
      failure_message { |actual| cfg.message.call(actual, expected) }
      failure_message_when_negated { |actual| cfg.message_when_negated.call(actual, expected) }
    end

  end
end

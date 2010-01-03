require 'spec/spec_helper'

describe "xml" do
  before(:each) do
    @xml = <<-XML
      <root>
        <one>1</one>
        <two>2</two>
      </root>
    XML
  end

  it "shoul match_xml" do
    @xml.should match_xml(<<-XML)
      <root>
        <one>1</one>
        <two>2</two>
      </root>
    XML
  end

  it "should not match_xml" do
    @xml.should_not match_xml(<<-XML)
      <root>
        <one>2</one>
      </root>
    XML
  end

  it "should match_xml_structure" do
    @xml.should match_xml_structure(<<-XML)
      <root>
        <one>2</one>
        <two>1</two>
      </root>
    XML
  end

  it "should not match_xml_structure" do
    @xml.should_not match_xml_structure(<<-XML)
      <root>
        <one>2</one>
        <three>1</three>
      </root>
    XML
  end
end

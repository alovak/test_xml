require 'spec_helper'

describe "equal_xml_structure(xml)" do
  subject {
    <<-XML
      <xml>
        <one>1</one>
        <two>2</two>
      </xml>
    XML
  }

  context "when xml structure is equal with subject" do
    it "should pass" do
      should equal_xml_structure(<<-XML)
        <xml>
          <one/>
          <two/>
        </xml>
      XML
    end
  end

  context "when xml structure is equal with subject and elements have different content" do
    it "should pass" do
      should equal_xml_structure(<<-XML)
        <xml>
          <one>4</one>
          <two>5</two>
        </xml>
      XML
    end
  end

  context "when xml has less elements" do
    it "should fail" do
      should_not equal_xml_structure(<<-XML)
        <xml>
          <one/>
        </xml>
      XML
    end
  end

  context "when xml has more elements" do
    it "should fail" do
      should_not equal_xml_structure(<<-XML)
        <xml>
          <one/>
          <two/>
          <three/>
        </xml>
      XML
    end
  end
end

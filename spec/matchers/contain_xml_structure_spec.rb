require 'spec_helper'

describe "contain_xml_structure(xml)" do
  subject {
    <<-XML
      <xml>
        <one>1</one>
        <two>2</two>
      </xml>
    XML
  }

  context "when xml is equal" do
    it "should pass" do
      should contain_xml_structure(<<-XML)
        <xml>
          <one>1</one>
          <two>2</two>
        </xml>
      XML
    end
  end

  context "when xml structure is equal but elements have different content" do
    it "should pass" do
      should contain_xml_structure(<<-XML)
        <xml>
          <one>4</one>
          <two>5</two>
        </xml>
      XML
    end
  end

  context "when xml has less elements" do
    it "should pass" do
      should contain_xml_structure(<<-XML)
        <xml>
          <one>1</one>
        </xml>
      XML
    end
  end

  context "when xml has more elements" do
    it "should fail" do
      should_not contain_xml_structure(<<-XML)
        <xml>
          <one>1</one>
          <two>2</two>
          <three>3</three>
        </xml>
      XML
    end
  end
end

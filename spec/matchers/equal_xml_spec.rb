require 'spec_helper'

# TODO: attributes are not matched.


describe "equal_xml(xml)" do
  subject {
    <<-XML
      <xml>
        <one>1</one>
        <two>2</two>
      </xml>
    XML
  }

  before { TestXml.enable_placeholders = false }

  context "when placeholders are enabled" do
    before { TestXml.enable_placeholders = true }

    context "and xml with equal structure contains placeholder" do
      it "should pass" do
        should equal_xml(<<-XML)
          <xml>
            <one>`example`</one>
            <two>2</two>
          </xml>
        XML
      end
    end
  end

  context "when subject has elements with attributes" do
    subject {
      <<-XML
        <xml test="true">
          <one type="text" attr="hello">1</one>
          <two type="integer">2</two>
        </xml>
      XML
    }

    context "and xml has similar elements with attributes" do
      it "should pass" do
        should equal_xml(<<-XML)
          <xml test="true">
            <one type="text" attr="hello">1</one>
            <two type="integer">2</two>
          </xml>
        XML
      end
    end

    context "and xml has elements with different attributes" do
      it "should fail" do
        should_not equal_xml(<<-XML)
          <xml>
            <one type="text" attr="hello">1</one>
            <two type="integer">2</two>
          </xml>
        XML
      end
    end
  end

  context "when xml is equal with subject" do
    it "should pass" do
      should equal_xml(<<-XML)
        <xml>
          <one>1</one>
          <two>2</two>
        </xml>
      XML
    end
  end

  context "when xml structure is equal with subject but elements have different content" do
    it "should fail" do
      should_not equal_xml(<<-XML)
        <xml>
          <one>4</one>
          <two>5</two>
        </xml>
      XML
    end
  end

  context "when xml has less elements" do
    it "should fail" do
      should_not equal_xml(<<-XML)
        <xml>
          <one>1</one>
        </xml>
      XML
    end
  end

  context "when xml has more elements" do
    it "should fail" do
      should_not equal_xml(<<-XML)
        <xml>
          <one>1</one>
          <two>2</two>
          <three>3</three>
        </xml>
      XML
    end
  end
end

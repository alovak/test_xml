module TestXml
  module NokogiriExt
    module Node
      def match?(element, compare_value = false)
        if compare_value && element.text_element?
          equal_text?(element)
        else
          contains_elements_of?(element) &&
          element.elements.all? {|el| matches_at_least_one?(el, compare_value) }
        end
      end

      def elements
        children.collect {|node| node if node.element? }.delete_if {|node| node.nil?}
      end

      def text_element?
        children.size == 1 && children.first.text?
      end

      private
      def equal_text?(element)
        content == element.content
      end

      def contains_elements_of?(element)
        element.elements.find {|el| not contains?(el)}.nil?
      end

      def contains?(element)
        children.find {|node| node.element? && node.name == element.name }
      end

      def matches_at_least_one?(element, compare_value)
        search(element.name).find { |el| el.match?(element, compare_value) }
      end

    end
  end
end

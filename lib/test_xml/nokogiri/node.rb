module TestXml
  module NokogiriExt
    module Node
      def match?(element)
        contains_elements_of?(element) && !element.elements.find {|el| not at(el.name).match?(el) }
      end

      def elements
        children.collect {|node| node if node.element? }.delete_if {|node| node.nil?}
      end

      private
      def contains_elements_of?(el)
        el.elements.find {|el| not contains?(el)}.nil?
      end

      def contains?(element)
        children.find {|node| node.element? && node.name == element.name }
      end
    end
  end
end

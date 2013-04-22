module TestXml
  module TestUnit
    module Assertions
      ASSERTIONS.each do |cfg|
        define_method(cfg.assert_name) do |a, b|
          correct_assert(MatcherMethods.send(cfg.name, a, b), cfg.message_for_should.call(a, b))
        end

        define_method(cfg.assert_not_name) do |a, b|
          correct_assert(! MatcherMethods.send(cfg.name, a, b), cfg.message_for_should_not.call(a, b))
        end
      end

    private
      def correct_assert(boolean, message)
        if RUBY_VERSION =~ /1.9.2/ or defined?(MiniTest)
          assert(boolean, message)
        else
          assert_block(message) do
            boolean
          end
        end
      end
    end
  end
end

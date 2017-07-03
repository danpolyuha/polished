require "polished/version"
require "polished/abstract_method_called_error"

module Polished

  def self.included klass
    add_abstract_functionality klass
  end

  private

  def self.add_abstract_functionality klass
    klass.class_eval do
      def self.abstract *methods
        methods.each do |method|
          define_method method do
            raise AbstractMethodCalledError, "An abstract method called. Implement '#{method}' method in a child class."
          end
        end
      end

    end
  end

end

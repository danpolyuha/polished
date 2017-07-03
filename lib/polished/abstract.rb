module Polished

  module Abstract
    def abstract(*methods)
      methods.each do |method|
        define_method method do
          raise AbstractMethodCalledError, "An abstract method called. Implement '#{method}' method in a child class."
        end
      end
    end
  end

end

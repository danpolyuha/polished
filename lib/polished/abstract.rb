module Polished
  module Abstract

    ERROR_MESSAGE = ->(method_name){"An abstract method called. Implement '#{method_name}' in a child class."}

    def abstract(*methods)
      methods.each do |method|
        define_method method do
          raise NotImplementedError, ERROR_MESSAGE.call(method)
        end
      end
    end

  end
end

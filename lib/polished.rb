require "polished/version"
require "polished/exceptions/abstract_method_called_error"
require "polished/abstract"

module Polished

  def self.included klass
    add_abstract_functionality klass
  end

  private

  def self.add_abstract_functionality klass
    klass.extend Polished::Abstract
  end

end

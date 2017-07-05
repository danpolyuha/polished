require "spec_helper"

RSpec.describe Polished do
  let(:dummy) { Class.new { include Polished } }

  describe "abstract" do

    let(:dummy_with_abstracts) do
      dummy.abstract :method1
      dummy.abstract :method2, :method3
      dummy
    end

    let(:object) { dummy_with_abstracts.new }
    let(:abstract_methods) { [:method1, :method2, :method3] }

    describe "creation of abstract methods" do
      it "responds to defined abstract methods" do
        expect(object).to respond_to(*abstract_methods)
      end
    end

    describe "implementation of abstract methods" do
      it "raises exception when an abstract method is called" do
        abstract_methods.each do |method|
          expect{object.send(method)}.to raise_error(NotImplementedError)
        end
      end
    end
  end

end

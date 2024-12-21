require "rspec"
require "./string_calculator"

describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe "#add" do
    context "when the input is an empty string" do
      it "returns 0" do
        expect(calculator.add("")) .to eq(0)
      end
    end

    context "when the input is a single number" do
      it "returns the number" do
        expect(calculator.add("1")) .to eq(1)
        expect(calculator.add("5")) .to eq(5)
      end
    end

    context "when the input is two numbers separated by a comma" do
      it "returns sum of the numbers" do
        expect(calculator.add("1,2")) .to eq(3)
        expect(calculator.add("10,20")) .to eq(30)
      end
    end
  end
end
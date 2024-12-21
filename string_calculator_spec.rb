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

      # when string contains more than two, comma separated numbers
      context "when the input contains an unknown amount of numbers" do
        it "returns their sum" do
          expect(calculator.add("1,2,3")).to eq(6)
          expect(calculator.add("10,20,30,40")).to eq(100)
          expect(calculator.add("5,5,5,5,5")).to eq(25)
        end
      end

      # when string contains numbers separated by the comma as well as "\n"
      context "when the input contains number separated by line breaking operator" do
        it "returns sum" do
          expect(calculator.add("10\n12,3")).to eq(25)
          expect(calculator.add("10\n20\n30,40")).to eq(100)
        end
      end
    end
  end
end

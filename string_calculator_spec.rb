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

      # when string contains multiple continuous newlines
      it 'raises an error for multiple continuous newlines' do
        expect { subject.add("1,\n\n2") }.to raise_error('continuous commas or newlines are not allowed')
      end

      # when string contains multiple continuous commas
      it 'raises an error for multiple continuous commas' do
        expect { subject.add("1,5,,2") }.to raise_error('continuous commas or newlines are not allowed')
      end

      # when string contains multiple continuous newlines and commas
      it 'raises an error for multiple continuous newlines and commas' do
        expect { subject.add("1,9\n,\n,2") }.to raise_error('continuous commas or newlines are not allowed')
      end

      # when string start with comma
      it 'raises an error for input starting with a comma' do
        expect { subject.add(',1,2') }.to raise_error('String cannot start or end with a comma or newline')
      end

       # when string ends with comma
      it 'raises an error for input ending with a comma' do
        expect { subject.add('1,2,') }.to raise_error('String cannot start or end with a comma or newline')
      end

      # when string start with \n
      it 'raises an error for input starting with a newline' do
        expect { subject.add("\n1,2") }.to raise_error('String cannot start or end with a comma or newline')
      end

      # when string end with \n
      it 'raises an error for input ending with a newline' do
        expect { subject.add("1,2\n") }.to raise_error('String cannot start or end with a comma or newline')
      end
    end
  end
end

class StringCalculator
  def add(numbers)
    return 0 if numbers == ""

    numbers.gsub("\n", ",").split(',').map(&:to_i).sum
  end
end

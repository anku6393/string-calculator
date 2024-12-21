class StringCalculator
  def add(numbers)
    return 0 if numbers == ""

    numbers.split(",").map(&:to_i).sum
  end
end

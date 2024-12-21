class StringCalculator
  def add(numbers)
    return 0 if numbers == ""

    # Check for continuous commas or newlines
    previous_char = ""
    numbers.each_char do |char|
      if char == ',' || char == "\n"
        if previous_char == ',' || previous_char == "\n"
          raise 'continuous commas or newlines are not allowed'
        end
      end
      previous_char = char
    end

    # Check if input starting or ending with comma or newline
    if numbers[0] == ',' || numbers[0] == "\n" || numbers[-1] == ',' || numbers[-1] == "\n"
      raise 'String cannot start or end with a comma or newline'
    end

    # calculate the sum of the numbers present in string
    numbers.gsub("\n", ",").split(',').map(&:to_i).sum
  end
end

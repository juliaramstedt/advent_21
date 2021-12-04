# frozen_string_literal: true

numbers = File.read('input.txt').split("\n")

most_common_value = []

def rating(numbers, col = 0, type:)
  fipparoo = { oxygen: [0, 1], co2: [1, 0] }[type]

  matrix = numbers.map { |num| num.split('') }.transpose

  most_common_value = fipparoo[((matrix[col].map(&:to_f).sum / numbers.size) >= 0.5 ? 1 : 0)]
  numbers = numbers.filter { |num| num[col].to_i == most_common_value }

  if numbers.size <= 1
    return numbers
  else
    rating(numbers, col + 1, type: type)
  end
end

puts rating(numbers, type: :oxygen).join.to_i(2) * rating(numbers, type: :co2).join.to_i(2)

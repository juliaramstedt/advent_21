# frozen_string_literal: true

numbers = File.read('input.txt').split("\n").map(&:to_i)
count = 0

numbers.each.with_index do |num, i|
  break if numbers[i + 3].nil?

  first_sum =  numbers[i..(i + 2)].sum
  second_sum = numbers[(i + 1)..(i + 3)].sum

  count += 1 if first_sum < second_sum
end

puts count

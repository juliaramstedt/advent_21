# frozen_string_literal: true

numbers = File.read('input.txt').split("\n")
count = 0

numbers.each.with_index { |num, i| count += 1 if num.to_i > numbers[i - 1].to_i }

puts count

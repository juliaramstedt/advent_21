# frozen_string_literal: true

numbers = File.read('input.txt').split("\n")

gamma_rate = []
epsilon_rate = []

numbers.map { |num| num.split('') }.transpose.each do |on_pos|
  gamma_rate << ((on_pos.map(&:to_f).sum / numbers.size) > 0.5 ? 1 : 0)
  epsilon_rate << (gamma_rate.last == 1 ? 0 : 1)
end

puts gamma_rate.join.to_i(2) * epsilon_rate.join.to_i(2)

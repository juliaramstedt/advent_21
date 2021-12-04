# frozen_string_literal: true

commands = File.read('input.txt').split("\n")
position = {}

commands.each do |command|
  dir, dist = command.split
  position[dir] = position[dir].to_i + dist.to_i
end

puts position['forward'].to_i * (position['down'].to_i - position['up'].to_i)

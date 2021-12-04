# frozen_string_literal: true

commands = File.read('input.txt').split("\n")
position = {}

commands.each do |command|
  dir, dist = command.split

  position[:aim] = position[:aim].to_i + dist.to_i if dir == 'down'
  position[:aim] = position[:aim].to_i - dist.to_i if dir == 'up'

  if dir == 'forward'
    position[:horizontal] = position[:horizontal].to_i + dist.to_i
    position[:depth] = position[:depth].to_i + (position[:aim].to_i * dist.to_i)
  end
end

puts position[:horizontal] * position[:depth]

# frozen_string_literal: true

rows = File.read('input.txt').split(%r{^\s*$})

numbers = rows[0].split(",").map(&:to_i)
boards = rows[1..].map { |board| board.split("\n").reject{ |b| b.empty? }.map { |b| b.split(" ").map(&:to_i) } }

def winner(numbers, boards)
  (0..numbers.size).each do |idx|
    boards.each.with_index do |board, board_idx|
      board.each do |row|
        return [numbers[0..idx], board_idx] if (row & (numbers[0..idx])).size == 5
      end

      board.transpose.each do |col|
        return [numbers[0..idx], board_idx] if (col & (numbers[0..idx])).size == 5
      end
    end
  end
end

called_numbers, winning_board_index = winner(numbers, boards)

puts (boards[winning_board_index].flatten - called_numbers).sum * called_numbers.last

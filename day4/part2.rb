# frozen_string_literal: true

rows = File.read('input.txt').split(%r{^\s*$})

numbers = rows[0].split(",").map(&:to_i)
boards = rows[1..].map { |board| board.split("\n").reject{ |b| b.empty? }.map { |b| b.split(" ").map(&:to_i) } }

def loser(numbers, boards)
  (0..numbers.size).each do |idx|
    called = numbers[0..(numbers.size - idx)]
    boards.each.with_index do |board, board_idx|
      if board.transpose.all? { |col| (col & called).size < 5 } && board.all? { |row| (row & called).size < 5 }
        return [numbers[0..(numbers.size - (idx - 1))], board_idx]
      end
    end
  end
end

called_numbers, losing_board_index = loser(numbers, boards)

puts (boards[losing_board_index].flatten - called_numbers).sum * called_numbers.last

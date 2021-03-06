require_relative 'win_now_block'

module Policy
  class WinNowBlockNaiveLine < WinNowBlock

    class << self

      def chosen_move(board, player, moves)
        winning_move(board, player, moves) ||
          blocking_move(board, player, moves) ||
          naive_line_move(board, player, moves) ||
          random_move(moves)
      end

      def naive_line_move(board, player, moves)
        naive_line_moves(board, player, moves).sample
      end

      # Choose lines that might be a winner next move
      # (ignoring that other player might block)
      #
      def naive_line_moves(board, player, moves)
        moves.select do |move|
          new_board = board.apply_move(move, player)
          winning_move(new_board, player, new_board.move_options)
        end
      end

    end

  end
end

module TicTacToe

  class Board

    def initialize 
      @board = Array.new(9) 
    end

    def show
      @board.map.with_index do |playermove, index|
        if index == 0 && playermove.nil?
          print("#{index} |") 
        elsif index == 2 && playermove.nil?
          print("| #{index}")
        elsif index == 3 && playermove.nil?
          print("#{index} |") 
        elsif index == 5 && playermove.nil?
          print("| #{index}")
        elsif index == 6 && playermove.nil?
          print("#{index} |")
        elsif index == 8 && playermove.nil?
          print("| #{index}")
        elsif playermove.nil?
          print(" #{index} ")
        else
          print(" #{playermove} ")
        end
        if (index + 1) % 3 == 0 && index < 7
          print "\n---------\n"
        end
      end
    end

    def update_cell (move)
      get_move.map do ||
      @board[get_move] << @current_player.symbol
    end

  end

  class Player
    
    def inizialize

    end

  end

  class Game
    def inizialize
    end

    def play
      while !winner
        @board.new
        prompt
        get_move
    end

    def prompt
      puts "#{current_player.playersymbol}, please enter the fixnum of the cell you would like to occupy:"
    end
      
    end

    def get_move(move)
      move = gets.chomp
    end


  end
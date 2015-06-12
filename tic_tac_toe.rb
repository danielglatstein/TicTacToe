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
      @board[move] << @current_player.symbol
    end

  end

  class Player
    
    def inizialize
      @current_player = Player.new
      @other_player = Player.new

    end

  end

  class Game
    def inizialize
    end

    def play
      while !winner
        puts @board
        prompt
        get_move
        update_cell
        if winner?
          congrats_winner
        elsif draw?
          restart?
        else switch_players
    end

    def prompt
      puts "#{current_player.playersymbol}, please enter the fixnum of the cell you would like to occupy:"
    end
      
    end

    def get_move(move)
      move = gets.chomp
    end

    def switch_player
      @current_player, @other_player = @other_player, @current_player
    end

    def draw?
    end

    def winner?
    end

    def restart?
    end

  end
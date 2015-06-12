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

    def update_cell (@symbol, @move)
      @board.map.with_index do |playermove, index|
        if index == @move
          playermove.replace("#{@symbol}") 
        end
      end
      puts @board
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
        symbol_prompt
        get_symbol
        cell_prompt
        get_move
        update_cell
        if winner? == true
          puts "congrats_winner"
        elsif draw? == true
          restart?
        else switch_players
    end

    def symbol_prompt
       puts "#{current_player}, please enter your symbol:"
    end

    def get_symbol(@symbol)
      @symbol = gets.chomp.to_s
    end

    def cell_prompt
      puts "#{current_player}, please enter the fixnum of the cell you would like to occupy:"
    end
      
    end

    def get_move(@move)
      @move = gets.chomp.to_s
    end

    def switch_player
      @current_player, @other_player = @other_player, @current_player
    end

    def draw?
      @board.map do |playermove|
        if playermove.contain(nil) 
          false
        elsif playermove.contain(nil) == false && winner? == false
          true
        end
      end
      draw?
    end

    def winner?
    end

    def restart?
    end

  end
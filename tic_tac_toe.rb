module TicTacToe

  class cell
    #can i have this method be each individual cell on the board, and control the value
    #so it starts off as value = nil
    #and then when one player claims the cell the value changes accordingly, x or o
  end

  class Board

    def initialize 
      @board = Array.new(9) 
    end

    def show
      @board.map.with_index do |x, index|
        if index == 0
          print("#{index} |") 
        elsif index == 2
          print("| #{index}")
        elsif index == 3
          print("#{index} |") 
        elsif index == 5
          print("| #{index}")
        elsif index == 6
          print("#{index} |")
        elsif index == 8
          print("| #{index}")
        elsif x.nil?
          print(" #{index} ")
        else
          print(" #{x} ")
        end
        if (index + 1) % 3 == 0 && index < 7
          print "\n---------\n"
        end
      end
    end

    def edit(@choice)
      @board[@choice] = @playersymbol  
      @turn = other_turn
    end

  end

  class Player
    
    def inizialize

    end

  end

  class Game
    def inizialize
  end
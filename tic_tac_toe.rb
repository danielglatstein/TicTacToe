module TicTacToe
  class Board

    def create 
      @board = Array.new(9) 
    end

    def show
      @board.each_with_index do |x, index|
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

    def edit(choice, player)

    end

  end

  class Player
    
    def create

    end

  end

  class Game

  end
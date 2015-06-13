module TicTacToe

      class Game

            def play
              turn = 0 
              while winner? && draw? != true
                @board.show
                turn
                symbol_prompt
                get_symbol
                cell_prompt
                get_move
                update_cell
                if status.winner? == true
                  puts "congrats_winner"
                elsif status.draw? == true
                  restart?
                else 
                  turn += 1
                end
              end
            end


            def update_cell (symbol, move)
              @board.map.with_index do |playermove, index|
                if move == index
                  @board[index] = "#{symbol}" 
                end
              end
            end

            def symbol_prompt
               puts "#{current_player}, please enter your symbol:"
            end

            def get_symbol(symbol)
              @symbol = gets.chomp.to_s
            end

            def cell_prompt
              puts "#{current_player}, please enter the fixnum of the cell you would like to occupy:"
            end
              
            end

            def get_move(move)
              @move = gets.chomp.to_s
            end

            def turn
              if turn.even == true
               @current_player = @player1
              else
               @current_player = @player2
              end
            end

            def restart?
              puts @board.new
            end

      end

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
          if @board.map 
        end

      end

      class Player
        
        def inizialize
          players = ["X", "O"].cycle
        end

      end

end

  
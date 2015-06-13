module TicTacToe

      class Game

            def play 
              turn = 0 
              while winner? && draw? != true
                current_player = players.next
                @board.show
                cell_prompt
                get_move
                update_cell
                if status.winner? 
                  puts "congrats_winner"
                elsif status.draw? 
                  restart?
                else 
                  turn += 1
                end
              end
            end

            def cell_prompt
              puts "#{current_player}, please enter the fixnum of the cell you would like to occupy:"
            end

            def get_move(move)
              move = gets.chomp.to_s
            end

            def turn
              if turn.even == true
               @current_player = @players[0]
              else
               @current_player = @players[1]
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

            def moves
              spaces.compact.count
            end

            def update_cell (cell, symbol)
              # expected output if 
              # (current_player = "X") and (move = 8)
              # to return @board[8] = "X"
              # @board = [nil, nil, nil, nil, nil, nil, nil, "X"]
                  @board[cell] = symbol 
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

            WINNING_COMBINATIONS = [
                # Horizontal wins:
                [0, 1, 2], [3, 4, 5], [6, 7, 8],
                # Vertical wins:
                [0, 3, 6], [1, 4, 7], [2, 5, 8],
                # Diagonal wins:
                [0, 4, 8], [2, 4, 6]
            ]

            def winning_combination
              WINNING_COMBINATIONS.each do |combo|
                #this returns an array of all the winning combos
                if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                #ex. [combo[0] by itself calls the first index of every array in WINNING_COMBINATIONS.each i.e. "0, 3, 6, 0, 1, 2, 0, 2"
                #so board[combo[0]] will call the value of every object at @boards[index] for "0, 3, 6, 0, 1, 2, 0, 2"
                #so to test it out if our @board=["o", "o", "o", "o", nil, nil, nil, nil, "o"] 
                  return combo unless @board[combo[0]].nil?
                  #combo (and this method) should return [0, 1, 2] in our winning combination example; 
                  #unless sets it so that a combo of "nil" cant be a winner
                end
              end
              false
              #returns false if no valid combo is found
            end

          end

      class Player
        
          def inizialize
            @players = ["X", "O"]
          end

      end

end

  
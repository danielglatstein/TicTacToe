# Tic tac toe seemed like a simple game, but building it in Ruby has proven to be an exciting challenge. 
# In the process, I have learned a lot about the logic skills required to simplify an object down to its most essential functions.

# This exercize helped me to become much more informed with how to test my methods in IRB. I learned to understand the importance 
# of having classes that serve unique purposes and contain short, simple methods with one task. The project has also helped to show me
# concepts that I need to continue studying in order to more easily apply them in my work.
# For instance, variables and how they are passed from class to class. 

# The first question that came to my mind when tackling this problem was: "how will i represent the board?"
# I reasoned that I had to make 'the board' an array that would hold 9 objects, each representing an empty cell. 
# At first, I thought the array should look like this: "board= [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]" and then the spaces could
# be represented by grid coordindates i.e. the middle cell would be (1,1).

# After some trial and error, I wanted to simplify the array to be how it is now: "board = Array.new(9)".
# Why make it more complicated then it needs to be? Now each cell on the board can be indexed with one number 0..8.
# i.e. the middle cell would be board[4].

module TicTacToe

      class Board

            def initialize 
              @board = Array.new(9) 
            end

# How could I represent the classic tic-tac-toe board?
# The '|' key looks a lot like the line. So I set it to be on the left and right sides of the middle column respectively.

# I wanted a 'nil' object to be represented with the number cell it was occupying, so I called .map.with_index on the board.
# If the objects value changed, it would be represented by the string that replaced it. 

# By adding 1 to the index, I could puts a new line every third cell by evenly dividing the index by 3. This would create 
# the three rows I needed. 

            def display_board
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

# Most importantly the Board Class should be able to create and display the board. I figured the Class should be responsible 
# for updating the cells (to change them from nil to "X"/"O" in the correct place), and also be able to analyze
# the board if there is a winner or if the game was a draw. 
                
            def update_cell (cell, symbol)
              symbol = turn
              cell = get_move
              # expected output if 
              # (current_player = "X") and (move = 8)
              # to return @board[8] = "X"
              # @board = [nil, nil, nil, nil, nil, nil, nil, nil, "X"]
                  @board[cell] = symbol 
            end

# I wanted a method that could keep track of how many moves had been made. This will be a useful tool 
# for determining a draw and helping to show whose turn it is. 

            def moves
              @board.compact.count
              # calling .compact reduces the number of objects to anything that has a true value (eliminates nil)
              # and .count will return the number of objects
              # e.x. if @board = ["x", "x", "o", "o", "o", "x", "o", nil, "x"] , moves would return 8
            end

# To see if there was a draw, the method is set to return false if the array still includes nil.
# The method returns true in there are no more nil objects in the array and no winner was declared. 


            def draw?
              if @board.include?(nil) 
                return false
              elsif winner == false && @board.include?(nil) == false
                return true
              end
            end

# I needed to set a key of all the possible winning combinations. That way I could use my other methods to cross check 
# with the 'Board Array' to see if combinations matched. 

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
                # this calls an array of all the winning combos arrays
                if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                # ex. combo[0] by itself calls the first index of every array in WINNING_COMBINATIONS.each i.e. "0, 3, 6, 0, 1, 2, 0, 2"
                # so @board[combo[0]] will call the value of every object at @board[index] for "0, 3, 6, 0, 1, 2, 0, 2"
                # so to test it out if our @board=["o", "o", "o", "o", nil, nil, nil, nil, "o"] 
                  return combo unless @board[combo[0]].nil?
                  # combo (and this method) should return [0, 1, 2] in our winning combination example; 
                  # the 'unless' sets it so that a combo of "nil" cannot be a winner
                end
              end
              false
              # returns false if no valid combo is found
            end

            def winner
              combo = winning_combination
              # this sets the instance variable 'combo' equal to the output of the winning_combination method i.e. [2, 4, 6]
              combo ? @board[@combo[0]] : false
              # ternery expression saying if combo is true (winning_combination method will return a false if there is no valid combo)
              # then return the first object in the @board[2]
              # which if @board= ["x", "x", "o", "o", "o", "x", "o", nil, "x"], would be "X"
            end

          end

# In planning the game, I knew I needed a player class. 
# I wanted to make this as simple as possible, so the players are just an array with two objects, each one representing a player. 

      class Player
          
            def inizialize
              @players = ["X", "O"]
            end

      end

# Drawing from the 'Simple Blackjack' lesson on Learn.co, I wanted a class that would serve as the 'game controller', in that it
# would help move the game from one step to the next. 

      class Game

# To begin, game needs a new set of Players and a new Board.  


            def initialize
              players = Players.new
              board = Board.new
            end

# I wanted the 'play method' below to be like the 'runner method' in the 'Simple Blackjack' lesson. 
# It took great attention to detail and lots of abstraction to get the game down to what I thought were the most essential tasks. 
            
            def play(players, board)
              # To start, the method takes two arguments, the players and board array.   
              while winner == false
                # Then I set up a while loop that will keep going until there is no winner.
                display_board
                # I started by calling the display_board method (from the Board Class) to show 
                # the array in the traditional Tic-Tac-Toe formatting. 
                cell_prompt
                # I Prompt the Player to make their selection. 
                get_move
                # Here is where the Player imputs their selection. 
                board.update_cell
                # Update_cell (from the Board Class) will take the Player's input and update the value of the object at the 
                # corresponding Board[index].  
                if winner == true 
                  puts winner
                  break
                  # This ends the loop if there has been a winner.
                elsif draw == true
                  break
                  # This ends the loop if the match is a draw. 
                end
              end
              # Otherwise, the loop keeps going. 
            end

# How does the Game know which player's turn it is? By counting the number of moves (in the method from the Board Class) 
# I set the turn method to return "X" if it is an even numbered turn (0, 2, 4, 6, 8) and it will be "O" if moves is odd. 

            def turn
              # to test I set @board = ["o", "o", "o", "o", nil, nil, nil, "x", "x"]
              # moves method would return 6, b/c 6 spaces have values, and 3 are nil
              if moves.to_i.even? == true
                current_player = @players[0]
                # says if moves is an even number set current_player equal to the first object in @players
                # @players = ["X", "O"]
              elsif 
                current_player = @players[1]
              end
              current_player
              # for our example this would return "X", if the moves method returned an odd number it would be "O"
            end

            def cell_prompt
              puts "#{turn}, please enter the fixnum of the cell you would like to occupy:"
            end

            def get_move
              move = gets.chomp.to_s
            end
            
      end

end

  
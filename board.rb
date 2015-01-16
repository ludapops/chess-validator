require 'awesome_print'

# board = ChessBoard.new



########################################################






# class ChessBoard
#     def initialize
#         @pieces = {}
#         #black
#         @pieces["a2"]= Pawn.new('black',@pieces['a2']) 
#         @pieces["b2"]= Pawn.new('black',@pieces['b2']) 
#         @pieces["c2"]= Pawn.new('black',@pieces['c2']) 
#         @pieces["d2"]= Pawn.new('black',@pieces['d2']) 
#         @pieces["e2"]= Pawn.new('black',@pieces['e2']) 
#         @pieces["f2"]= Pawn.new('black',@pieces['f2']) 
#         @pieces["g2"]= Pawn.new('black',@pieces['g2']) 
#         @pieces["h2"]= Pawn.new('black',@pieces['h2'])
#         @pieces["a1"] = Rook.new('black',@pieces['alphaNumeric'])
#         @pieces["b1"] = Kight.new('black',@pieces['alphaNumeric'])
#         @pieces["c1"] = Bishop.new('black',@pieces['alphaNumeric'])
#         @pieces["d1"] = Queen.new('black',@pieces['alphaNumeric'])
#         @pieces["e1"] = King.new('black',@pieces['alphaNumeric'])
#         @pieces["f1"] = Bishop.new('black',@pieces['alphaNumeric'])
#         @pieces["g1"] = Knight.new('black',@pieces['alphaNumeric'])
#         @pieces["h1"] = Rook.new('black',@pieces['alphaNumeric'])





        
#         #white
#         @pieces["a7"]= Pawn.new('white', @pices['a7']) 
#         @pieces["b7"]= Pawn.new('white', @pices['b7']) 
#         @pieces["c7"]= Pawn.new('white', @pices['c7']) 
#         @pieces["d7"]= Pawn.new('white', @pices['d7']) 
#         @pieces["e7"]= Pawn.new('white', @pices['e7']) 
#         @pieces["f7"]= Pawn.new('white', @pices['f7']) 
#         @pieces["g7"]= Pawn.new('white', @pices['g7']) 
#         @pieces["h7"]= Pawn.new('white', @pices['h7'])
#         @pieces["a7"] = Rook.new('white', @pices['alphaNumeric'])
#         @pieces["b7"] = Kight.new('white', @pices['alphaNumeric'])
#         @pieces["c7"] = Bishop.new('white', @pices['alphaNumeric'])
#         @pieces["d7"] = Queen.new('white', @pices['alphaNumeric'])
#         @pieces["e7"] = King.new('white', @pices['alphaNumeric'])
#         @pieces["f7"] = Bishop.new('white', @pices['alphaNumeric'])
#         @pieces["g7"] = Knight.new('white', @pices['alphaNumeric'])
#         @pieces["h7"] = Rook.new('white', @pices['alphaNumeric'])

        
#     end

 

#     def legal_movement?(initial, final)
#         # access piece at initial position
#         piece = @pieces[initial]
#     end
# end

class Piece
    # stores position
    # stores team (white or black)
    def initialize(team, i_position)

        if team == "white" 
            @team = "white"
        else 
            @team = "black"
        end




        @i_position = decode(i_position)
        
    end

    def decode(alphaNumeric)

        letters_toNumber = {"a" => 1, "b"=> 2, "c"=> 3, "d"=> 4, "e"=> 5, "f"=> 6, "g"=> 7, "h"=> 8} 
        key = alphaNumeric[0]
        x = letters_toNumber[key]
        y = alphaNumeric[1].to_i
        deocoded_position = [x,y]
        return deocoded_position

    end



end 


class Pawn < Piece
    def initialize(team, i_position)
        @hasMoved = 0
        super(team, i_position)
    end 
    # moves forward one space
    # if initial movement, can move two spaces
    def move(team, final)
        decoded_final = decode(final)

        if @hasMoved == 0 && team == "black"
            @hasMoved = 1
            
            if @i_position[0] == decoded_final[0] &&  
                @i_position[1] - decoded_final[1] > 0 && 
                @i_position[1] - decoded_final[1] <= 2 
                    
                    puts "legal move"
            else 
                puts "ILLEGAL MOVE"
            end
        elsif @hasMoved != 0 && team == "black"



            if @i_position[0] == decoded_final[0] &&
              @i_position[1] - decoded_final[1] > 0 &&
               @i_position[1] - decoded_final[1] <= 1 
                    
                    puts "legal move"
            else 
                puts "ILLEGAL MOVE"
            end
         
        elsif @hasMoved == 0 && team == "white"
            @hasMoved = 1
            decoded_final = decode(final) 
            if @i_position[0] == decoded_final[0] &&  
                @i_position[1] - decoded_final[1] < 0 && 
                decoded_final[1] - @i_position[1]  <= 2 
                    
                    puts "legal move"
            else
                puts "ILLEGAL MOVE"
            end  
        elsif @hasMoved != 0 && team == "white"

            if @i_position[0] == decoded_final[0] &&  
                @i_position[1] - decoded_final[1] < 0 && 
                decoded_final[1] - @i_position[1]  <= 1 
                    
                    puts "legal move"
            else
                puts "ILLEGAL MOVE"
            end 

        end 
    end

end

class Rook  <Piece
    def initialize(team, i_position)
        super(team, i_position)
    end

    def move(final)
        decoded_final = decode(final) 

        if @i_position[0] == decoded_final[0] || @i_position[1] == decoded_final[1]
            puts "legal move"
        else 
            puts "ILLEGAL MOVE"
        end  

    end
end

class Knight <Piece
    def initialize(team, i_position)
        super(team, i_position)
    end

    def move(final)
        decoded_final = decode(final)
    end
end

class Bishop <Piece
    def initialize(team, i_position)
        super(team, i_position)
    end

    def move(final)
        decoded_final = decode(final)
        if (decoded_final[0] - @i_position[0]).abs == (decoded_final[1] - @i_position[1]).abs 
        puts "leagal move"   
        else
            puts"ILLEGAL MOVE" 
        end
    end
end

class Queen <Piece
    def initialize(team, i_position)
        super(team, i_position)
    end

    def move(final)
        decoded_final = decode(final)
    end
end

class King <Piece
    def initialize(team, i_position)
        super(team, i_position)
    end

    def move(final)
        decoded_final = decode(final)
    end
end 


# x = Pawn.new("black", "a7")
# # x.move("black", "a6")
# # x.move("black", "a1")
# # x.move("black", "b6")
# # x.move("black", "c4")

#x =Bishop.new("black", "c8")
#x.move('d7')
#x.move('b7')
#x.move('c7')
#x.move('c6')




# y = Pawn.new("white", "a2")

# y.move("white", "a4")
# y.move("white","a3")
# y.move("white", "a1")
# y.move("white", "b3")
# y.move("white", "c6")


# z = Pawn.new("black", "a4")

# d =Pawn.new("white", "b4")

require 'awesome_print'

def decode(alphaNumeric)

    blah = {"a" => 1, "b"=> 2, "c"=> 3, "d"=> 4, "e"=> 5, "f"=> 6, "g"=> 7, "h"=> 8} 
    key = alphaNumeric[0]
    x = blah[key]
    y = alphaNumeric[1].to_i

    return [x,y]

end

ap decode("a3")


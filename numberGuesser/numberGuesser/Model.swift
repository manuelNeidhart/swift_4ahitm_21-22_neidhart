class Model {
    var numberToGuess = 0
    var countOfTries = 0
    
    func compare(guess guessedNumber:Int!) -> Int! {
        var result = 0
        
        if guessedNumber < numberToGuess{
           result = -1
        }
        else if guessedNumber > numberToGuess{
          result = 1
        }
        
        return result
    }
    
    func compare(guessedString:String!) -> Int! {
        let guess = Int(guessedString)
        
        return compare(guess: guess)
    }
    
    func isValid(guessedNum:Int!) -> Bool {
        if let number = guessedNum {
            if number > 0 && number < 100{
                return true
            }
            return false
        } else {
            return false
        }
    }
}

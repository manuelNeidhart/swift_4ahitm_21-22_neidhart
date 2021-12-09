import Foundation

class Model {
    var names:[[String]] = []
    
    func addName(firstName:String, lastName:String){
        if (firstName != "" || lastName != "") {
            names.append([firstName,lastName])
        }
    }
    
}

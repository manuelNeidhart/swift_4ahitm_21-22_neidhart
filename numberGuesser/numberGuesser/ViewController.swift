import UIKit

class ViewController: UIViewController {
    var model = Model()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func onChangeTextField(_ sender: UITextField) {
        button.isEnabled = model.isValid(guessedNum: Int(sender.text!));
    }
    
    @IBOutlet weak var label: UILabel!
    @IBAction func guessButton(_ sender: Any) {
        let guessedNumber = model.compare(guessedString: textField.text!)
        let text:String?
    
        switch guessedNumber {
        case -1:
            text = "zu klein ! ! !"
        case 1:
            text = "zu groß ! ! !"
        default:
            text = "RICHTIG ! ! !"
        }
        
        label.text = text
        
        model.countOfTries += 1
        print("Counter \(model.countOfTries)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.numberToGuess = Int.random(in: 0..<100)
        print("Zu erratende Zahl \(model.numberToGuess)")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let guessedNumber = model.compare(guessedString: textField.text!)
        
        if guessedNumber == 0 {
            return true
        }
        return false
    }
}


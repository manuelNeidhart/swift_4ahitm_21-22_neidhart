import UIKit

class ViewController: UIViewController {
    let queue = DispatchQueue(label: "demo")
    let link = "https://jsonplaceholder.typicode.com/todos"
    @IBOutlet weak var readyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queue.async {
            let titles = self.download()
            DispatchQueue.main.async {
                self.readyLabel.text = titles[0]
            }
        }
    }
    
    func download() -> [String] {
        var titles = [String]()
        if let url = URL(string: link) {
            if let data = try? Data(contentsOf: url) {
                print("data: \(data)")
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                    if let array = jsonObject as? [ [String: Any] ] {
                        for obj in array {
                            let id = obj["id"] as! Int
                            let title = obj["title"] as! String
                            print("obj=\(id) title=\(title)")
                            titles.append(title)
                        }
                    }
                }
                
                else {
                    print("Failed to fetch JSON-Data!")
                }
            }
            
            else {
                print("Failed to fetch JSON-Data!")
            }
        }
        
        return titles
    }
}



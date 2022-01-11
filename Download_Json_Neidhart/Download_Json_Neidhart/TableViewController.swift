import UIKit

class TableViewController: UITableViewController {
    
    let queue = DispatchQueue(label: "demo")
    let link = "https://jsonplaceholder.typicode.com/posts"
    var titles = [String]()
    var bodies = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queue.async {
            let titles = self.download1()
            let bodies = self.download2()
            
            DispatchQueue.main.async {
                print("titles: \(titles)")
                print("bodies: \(bodies)")
                self.titles = titles
                self.bodies = bodies
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
        let title = titles[indexPath.row]
        let body = bodies[indexPath.row]
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = body
        return cell
    }

    func download1() -> [String] {
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

    func download2() -> [String] {
        var bodies = [String]()
        if let url = URL(string: link) {
            if let data = try? Data(contentsOf: url) {
                print("data: \(data)")
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                    if let array = jsonObject as? [ [String: Any] ] {
                        for obj in array {
                            let id = obj["id"] as! Int
                            let body = obj["body"] as! String
                            print("obj=\(id) body=\(body)")
                            bodies.append(body)
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
        
        return bodies
    }
}


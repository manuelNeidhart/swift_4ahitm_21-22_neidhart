import UIKit

class TableViewController: UITableViewController{
    
    var model:Model!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let line = model.names[indexPath.row];
        
        cell.textLabel!.text = line[1];
        cell.detailTextLabel!.text = line[0];

        return cell
    }
}

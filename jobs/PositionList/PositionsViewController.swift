import UIKit

class PositionsViewController: UIViewController {

    var viewModel: PositionsViewModel?
    @IBOutlet weak var positionsTable: UITableView!
    @IBOutlet weak var searchText: UITextField!
    
    @IBAction func startSearch(_ sender: Any) {
        if let text = searchText.text,
           !text.isEmpty,
           let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            viewModel?.startSearchFor(text: encodedText)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PositionsViewModel(controller: self)
        viewModel?.config(tableView: positionsTable)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


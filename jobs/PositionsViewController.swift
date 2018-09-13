import UIKit

class PositionsViewController: UIViewController {

    var viewModel: PositionsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PositionsViewModel(controller: self)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


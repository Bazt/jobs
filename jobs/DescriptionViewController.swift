import UIKit

class DescriptionViewController: UIViewController {
    
    var viewModel: DescriptionViewModel?

    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var positionTitle: UILabel!
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var positionDescription: UITextView!
    
    func set(position: Position) {
        viewModel = DescriptionViewModel(controller: self)
        viewModel?.position = position
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel?.config()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

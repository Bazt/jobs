import Foundation
import UIKit

class PositionCell: UITableViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var city: UILabel!
    
    func config(position: Position) {
        title.text = position.title
        city.text = position.city
        WebData.getImage(position: position, to: logo)
    }
}

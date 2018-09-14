import Foundation
import UIKit

class DescriptionViewModel   {
    private weak var controller: DescriptionViewController? = nil
    
    var position: Position? = nil
    
    init(controller: DescriptionViewController) {
        self.controller = controller
    }
    
    func config() {
        controller?.city.text = position?.city
        controller?.positionTitle.text = position?.title
        controller?.positionDescription.text = position?.description.htmlToString
        controller?.logo.image = position?.companyLogo
    }
}

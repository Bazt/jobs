import Foundation
import UIKit

class PositionsViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var model: PositionsModel? = nil
    private weak var controller: PositionsViewController? = nil
    
    init(controller: PositionsViewController) {
        super.init()
        self.controller = controller
        self.model = PositionsModel(viewModel: self)
    }
    
    func config(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func startSearchFor(text: String) {
        WebData.getPositionsFor(searchString: text) {
            positions in
            self.model?.positions = positions
        }
    }
    
    func onPositionsChanged() {
        controller?.positionsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = model?.positions.count ?? 0
        print("numberOfRowsInSection: \(numberOfRows)")
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt \(indexPath.row)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PositionCell", for: indexPath)
        
        guard let positionCell = cell as? PositionCell,
              let position = model?.positions[indexPath.row] else {
            return cell
        }
        
        positionCell.accessoryType = .disclosureIndicator
        positionCell.config(position: position)
        
        return positionCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Description", bundle: nil)
        
        guard let controller = storyboard.instantiateViewController(withIdentifier: "DescriptionViewController") as? DescriptionViewController,
            let position = model?.positions[indexPath.row] else {
                return
        }
        
        controller.set(position: position)
        self.controller?.present(controller, animated: true, completion: nil)
    }
    

    
    
}

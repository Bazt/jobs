//
//  PositionsViewModel.swift
//  jobs
//
//  Created by Oleg Sherbakov on 12/09/2018.
//  Copyright © 2018 some org. All rights reserved.
//

import Foundation
import UIKit

class PositionsViewModel {
    
    private var model = PositionsModel()
    private weak var controller: PositionsViewController?
    
    init(controller: PositionsViewController) {
        self.controller = controller
    }
    
    func config(view: UIView) {
        
    }
    
    
}

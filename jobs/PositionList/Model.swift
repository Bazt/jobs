//
//  Model.swift
//  jobs
//
//  Created by Oleg Sherbakov on 13/09/2018.
//  Copyright © 2018 some org. All rights reserved.
//

import Foundation

protocol PositionsModelProtocol {
    var positions: [Position] {get}
}

class PositionsModel: PositionsModelProtocol {
    private weak var viewModel: PositionsViewModel?
    var positions = [Position]()
    {
        didSet {
            viewModel?.onPositionsChanged()
        }
    }
    
    init(viewModel: PositionsViewModel) {
        self.viewModel = viewModel
    }
}

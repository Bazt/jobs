//
//  Model.swift
//  jobs
//
//  Created by Oleg Sherbakov on 13/09/2018.
//  Copyright © 2018 some org. All rights reserved.
//

import Foundation

protocol PositionsModelProtocol {
    var positions: [PositionProtocol] {get}
}

class PositionsModel: PositionsModelProtocol {
    var positions = [PositionProtocol]()
}

//
//  Position.swift
//  jobs
//
//  Created by Oleg Sherbakov on 13/09/2018.
//  Copyright © 2018 some org. All rights reserved.
//

import Foundation
import UIKit

protocol PositionProtocol {
    var title: String {get}
    var city: String {get}
    var companyLogo: UIImage? {get}
}

struct Position: PositionProtocol {
    var title: String
    var city: String
    var companyLogo: UIImage?
}



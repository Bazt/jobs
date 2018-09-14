//
//  Position.swift
//  jobs
//
//  Created by Oleg Sherbakov on 13/09/2018.
//  Copyright © 2018 some org. All rights reserved.
//

import Foundation
import UIKit

class Position {
    var title: String
    var city: String
    var companyLogo: UIImage?
    var logoPath: String?
    var description: String
    
    init(title: String, city: String, logo: UIImage? = nil, path: String? = nil, description: String) {
        self.title = title
        self.city = city
        self.companyLogo = logo
        self.logoPath = path
        self.description = description
    }
}



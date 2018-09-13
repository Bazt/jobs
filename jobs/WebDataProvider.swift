//
//  WebDataProvider.swift
//
//  Created by Oleg Sherbakov on 13/09/2018.
//  Copyright © 2018 some org. All rights reserved.
//

import Foundation


protocol WebDataProvider {
    static func getPositionsFor(searchString: String) -> [PositionProtocol]
}

class WebData: WebDataProvider {
    class func getPositionsFor(searchString: String) -> [PositionProtocol]
    {
        return [Position(title: "title1", city: "Moscow", companyLogo: nil), Position(title: "title2", city: "spb", companyLogo: nil)]
    }
}

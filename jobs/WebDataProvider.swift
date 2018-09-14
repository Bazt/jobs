//
//  WebDataProvider.swift
//
//  Created by Oleg Sherbakov on 13/09/2018.
//  Copyright © 2018 some org. All rights reserved.
//

import Foundation
import Alamofire

protocol WebDataProvider {
    static func getPositionsFor(searchString: String, completion: @escaping ([Position])->())
    static func getImage(position: Position, to view: UIImageView) 
}

class WebData: WebDataProvider {
    class func getImage(position: Position, to view: UIImageView) {
        if let path = position.logoPath {
            Alamofire.request(path).responseData { response in
                if let data = response.result.value {
                    let image = UIImage(data: data)
                    view.image = image
                }
            }
        }
    }
    
    class func getPositionsFor(searchString: String, completion: @escaping ([Position])->()) {
//        completion([Position(title: "title1", city: "Moscow", companyLogo: nil, description: "descr"), Position(title: "title2", city: "spb", companyLogo: nil, description: "descr")])
        let page = 0
        let path = "https://jobs.github.com/positions.json?search=\(searchString)&amp;page=\(page)"
        Alamofire.request(path).responseJSON {
            response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("JSON: \(utf8Text)") // serialized json response
                let positions = PositionsParser.parseJsonFrom(string: utf8Text)
                for var position in positions {
                    if let path = position.logoPath {
                        Alamofire.request(path).responseData { response in
                            if let data = response.result.value {
                                let image = UIImage(data: data)
                                position.companyLogo = image
                            }
                        }
                    }
                }
                
                completion(positions)
                return
            }
            
           completion([])
        }
    }
}

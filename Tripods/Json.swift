//
//  Json.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-06.
//  Copyright © 2017 George. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol JSONDecodable {
    init(json: JSON) throws
}

extension DataRequest {
    func jsonRepsonse<T: JSONDecodable>(callback: @escaping (T) -> Void) {
        self.responseJSON { response in
            switch response.result {
            case .success(let value):
                if let obj = try? T(json: JSON(value)) {
                    callback(obj)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

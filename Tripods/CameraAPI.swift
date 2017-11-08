//
//  CameraAPI.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-06.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class CameraAPI {
    let baseUrl = "http://192.168.0.18:5000"
    
    func captureImage(callback: @escaping (CaptureResponse) -> Void) {
        Alamofire.request("\(baseUrl)/capture", method: .post).jsonRepsonse { callback($0) }
    }
}

struct CaptureResponse {
    let name: String
    let cameraModel: String
    let base64Image: String
    
    var image: UIImage? {
        if let imageData = NSData(base64Encoded: base64Image, options: .ignoreUnknownCharacters) {
            return UIImage(data: imageData as Data)
        }
        return nil
    }
}

extension CaptureResponse: JSONDecodable {
    init(json: JSON) throws {
        name = json["name"].string!
        cameraModel = json["cameraModel"].string!
        base64Image = json["base64Image"].string!
    }
}

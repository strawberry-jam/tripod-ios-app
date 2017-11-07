//
//  CameraAPI.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-06.
//  Copyright © 2017 George. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class CameraAPI {
    func captureImage() {
        Alamofire.request("https://api.github.com")
            .jsonRepsonse { (res: GithubApi) in
                print(res.followersUrl)
            }
    }
}

struct CaptureResponse {
    let cameraModel: String
    let base64Image: String
}

extension CaptureResponse: JSONDecodable {
    init(json: JSON) throws {
        cameraModel = json["cameraModel"].string!
        base64Image = json["base64Image"].string!
    }
}

struct GithubApi {
    let followersUrl: String
}

extension GithubApi: JSONDecodable {
    init(json: JSON) throws {
        followersUrl = json["followers_url"].string!
    }
}

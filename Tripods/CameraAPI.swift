//
//  CameraAPI.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-06.
//  Copyright © 2017 George. All rights reserved.
//

import Foundation

class CameraAPI {
    func captureImage(callback: (CaptureResponse) -> Void) {
        
    }
}

struct CaptureResponse {
    let cameraModel: String
    let base64Image: String
    
    
}

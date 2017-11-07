//
//  PhotosUtilis.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-06.
//  Copyright © 2017 George. All rights reserved.
//

import Photos

func fetchMostRecentPhoto(callback: @escaping (UIImage?) -> Void) {
    let fetchOptions = PHFetchOptions()
    fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    fetchOptions.fetchLimit = 1
    
    let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
    
    if let asset = fetchResult.firstObject {
        PHImageManager.default().requestImage(for: asset,
                                              targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                              contentMode: .aspectFit,
                                              options: nil,
                                              resultHandler: { image, info in callback(image) })
    } else {
        callback(nil)
    }
}

func ensurePhotoPermissions(_ doOnAuthorized: @escaping () -> Void) {
    let authorizationStatus = PHPhotoLibrary.authorizationStatus()
    
    switch (authorizationStatus) {
    case .authorized:
        doOnAuthorized()
    case .notDetermined:
        PHPhotoLibrary.requestAuthorization({ status in
            if status == .authorized {
                doOnAuthorized()
            }
        })
    default:
        return
    }
}

//
//  CameraViewController.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-04.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    let cameraControlsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    let lastPictureTakenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 2.0
        imageView.backgroundColor = .lightGray
        
        return imageView
    }()
    
    let cameraModelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Canon EOS 60D"
        label.textColor = .yellow
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cameraControlsContainer)
        cameraControlsContainer.addSubview(lastPictureTakenImageView)
        cameraControlsContainer.addSubview(cameraModelLabel)
        
        let margins = view.layoutMarginsGuide
        
        _ = cameraControlsContainer
            .with(height: 90.0)
            .anchorWidth(to: view.widthAnchor)
            .anchorBottom(to: margins.bottomAnchor)
        
        _ = lastPictureTakenImageView
            .with(width: 60.0)
            .with(height: 60.0)
            .anchorLeading(to: cameraControlsContainer.leadingAnchor, constant: 10)
            .alignCenterY(to: cameraControlsContainer.centerYAnchor)
        
        _ = cameraModelLabel
            .anchorTop(to: cameraControlsContainer.topAnchor, constant: 10)
            .anchorTrailing(to: cameraControlsContainer.trailingAnchor, constant: -10)
        
        view.setNeedsUpdateConstraints()
        
        ensurePhotoPermissions {
            fetchMostRecentPhoto { self.lastPictureTakenImageView.image = $0 }
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
}


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

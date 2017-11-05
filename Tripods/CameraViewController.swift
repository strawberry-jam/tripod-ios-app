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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cameraControlsContainer)
        cameraControlsContainer.addSubview(lastPictureTakenImageView)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
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
        
        super.updateViewConstraints()
    }
}

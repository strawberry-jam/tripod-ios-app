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
        
        _ = cameraModelLabel
            .anchorTop(to: cameraControlsContainer.topAnchor, constant: 10)
            .anchorTrailing(to: cameraControlsContainer.trailingAnchor, constant: -10)
        
        super.updateViewConstraints()
    }
}

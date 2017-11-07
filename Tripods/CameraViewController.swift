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
    
    let lastPictureTakenImageView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 2.0
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(onLastImageTakenClicked), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFill
        
        return button
    }()
    
    let captureButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 30.0
        button.addTarget(self, action: #selector(onCaptureClicked), for: .touchUpInside)
        
        return button
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
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(cameraControlsContainer)
        view.addSubview(lastPictureTakenImageView)
        view.addSubview(captureButton)
        view.addSubview(cameraModelLabel)
        
        let margins = view.layoutMarginsGuide
        
        _ = cameraControlsContainer
            .with(height: 90.0)
            .anchorLeading(to: view.leadingAnchor)
            .anchorWidth(to: view.widthAnchor)
            .anchorBottom(to: margins.bottomAnchor)
        
        _ = lastPictureTakenImageView
            .anchorHeight(to: cameraControlsContainer.heightAnchor, multiplier: 0.8)
            .anchorWidth(to: lastPictureTakenImageView.heightAnchor)
            .anchorLeading(to: cameraControlsContainer.leadingAnchor, constant: 6.0)
            .alignCenterY(to: cameraControlsContainer.centerYAnchor)
        
        _ = captureButton
            .with(width: 60.0)
            .with(height: 60.0)
            .alignCenterX(to: cameraControlsContainer.centerXAnchor)
            .alignCenterY(to: cameraControlsContainer.centerYAnchor)
        
        _ = cameraModelLabel
            .anchorTop(to: cameraControlsContainer.topAnchor, constant: 10)
            .anchorTrailing(to: cameraControlsContainer.trailingAnchor, constant: -10)
        
        view.setNeedsUpdateConstraints()
        
        ensurePhotoPermissions {
            fetchMostRecentPhoto {
                self.lastPictureTakenImageView.setBackgroundImage($0, for: .normal)
            }
        }
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }
    
    @objc func onCaptureClicked() {
        CameraAPI().captureImage()
    }
    
    @objc func onLastImageTakenClicked() {
        if let url = URL(string:"photos-redirect://") {
            UIApplication.shared.open(url)
        }
    }
}

extension CameraViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if lastPictureTakenImageView.frame.contains(location) {
            return FullScreenImageViewController()
        }
        
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.showDetailViewController(viewControllerToCommit, sender: self)
    }
}

//
//  CameraViewController.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-04.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .lightGray
        button.titleLabel?.textColor = .black
    
        return button
    }()
    
    let cameraControlsContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    let lastPictureTakenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8.0
        imageView.backgroundColor = .lightGray
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(cameraControlsContainer)
        cameraControlsContainer.addSubview(lastPictureTakenImageView)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        let margins = view.layoutMarginsGuide
        
        _ = textField
            .anchorLeading(to: margins.leadingAnchor, constant: 8.0)
            .anchorTrailing(to: button.leadingAnchor, constant: -8.0)
            .anchorTop(to: margins.topAnchor, constant: 80.0)
        
        _ = button
            .anchorWidth(to: margins.widthAnchor, multiplier: 0.3)
            .anchorHeight(to: textField.heightAnchor, multiplier: 1.0)
            .anchorTop(to: textField.topAnchor, constant: 0)
            .anchorTrailing(to: margins.trailingAnchor, constant: -8.0)
        
        _ = cameraControlsContainer
            .with(height: 100.0)
            .anchorWidth(to: margins.widthAnchor, multiplier: 1.0)
            .anchorLeading(to: margins.leadingAnchor, constant: 0)
            .anchorBottom(to: margins.bottomAnchor, constant: 0)
        
        _ = lastPictureTakenImageView
            .with(width: 50.0)
            .with(height: 50.0)
            .anchorLeading(to: cameraControlsContainer.leadingAnchor, constant: 8.0)
            .alignCenterY(to: cameraControlsContainer.centerYAnchor, constant: 0)
        
        super.updateViewConstraints()
    }
}

extension UIView {
    func anchorLeading(to anchor: NSLayoutXAxisAnchor, constant c: CGFloat) -> UIView {
        self.leadingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func anchorTrailing(to anchor: NSLayoutXAxisAnchor, constant c: CGFloat) -> UIView {
        self.trailingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func anchorTop(to anchor: NSLayoutYAxisAnchor, constant c: CGFloat) -> UIView {
        self.topAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func anchorBottom(to anchor: NSLayoutYAxisAnchor, constant c: CGFloat) -> UIView {
        self.bottomAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func anchorWidth(to dimension: NSLayoutDimension, multiplier m: CGFloat) -> UIView {
        self.widthAnchor.constraint(equalTo: dimension, multiplier: m).isActive = true
        return self
    }
    
    func anchorHeight(to dimension: NSLayoutDimension, multiplier m: CGFloat) -> UIView {
        self.heightAnchor.constraint(equalTo: dimension, multiplier: m).isActive = true
        return self
    }
    
    func with(height: CGFloat) -> UIView {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    func with(width: CGFloat) -> UIView {
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    func alignCenterX(to anchor: NSLayoutXAxisAnchor, constant c: CGFloat) -> UIView {
        self.centerXAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func alignCenterY(to anchor: NSLayoutYAxisAnchor, constant c: CGFloat) -> UIView {
        self.centerYAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
}

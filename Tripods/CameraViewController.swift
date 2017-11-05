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
        //view.addSubview(lastPictureTakenImageView)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        let margins = view.layoutMarginsGuide
        
        textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8.0).isActive = true
        textField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 80.0).isActive = true
        textField.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -8.0).isActive = true
        
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        button.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 1.0).isActive = true
        button.topAnchor.constraint(equalTo: textField.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -8.0).isActive = true
        
        cameraControlsContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        cameraControlsContainer.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        cameraControlsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        cameraControlsContainer.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
    
        lastPictureTakenImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8.0).isActive = true
        lastPictureTakenImageView.centerYAnchor.constraint(equalTo: cameraControlsContainer.centerYAnchor, constant: 0).isActive = true
        lastPictureTakenImageView.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        lastPictureTakenImageView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true

        
        super.updateViewConstraints()
    }
}

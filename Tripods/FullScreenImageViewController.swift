//
//  FullScreenImageViewController.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-06.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit

class FullScreenImageViewController: UIViewController {
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navCon = navigationController
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = .black
        view.addSubview(image)
        
        _ = image
            .anchorTop(to: view.topAnchor)
            .anchorLeading(to: view.leadingAnchor)
            .anchorTrailing(to: view.trailingAnchor)
            .anchorBottom(to: view.bottomAnchor)
        
        view.setNeedsUpdateConstraints()
        
        ensurePhotoPermissions {
            fetchMostRecentPhoto { self.image.image = $0 }
        }
        
    }
}

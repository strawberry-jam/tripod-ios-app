//
//  UIView+constraints.swift
//  Tripods
//
//  Created by George Antonious on 2017-11-05.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit

extension UIView {
    func anchorLeading(to anchor: NSLayoutXAxisAnchor, constant c: CGFloat = 0) -> UIView {
        self.leadingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func anchorTrailing(to anchor: NSLayoutXAxisAnchor, constant c: CGFloat = 0) -> UIView {
        self.trailingAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func anchorTop(to anchor: NSLayoutYAxisAnchor, constant c: CGFloat = 0) -> UIView {
        self.topAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func anchorBottom(to anchor: NSLayoutYAxisAnchor, constant c: CGFloat = 0) -> UIView {
        self.bottomAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func anchorWidth(to dimension: NSLayoutDimension, multiplier m: CGFloat = 1) -> UIView {
        self.widthAnchor.constraint(equalTo: dimension, multiplier: m).isActive = true
        return self
    }
    
    func anchorHeight(to dimension: NSLayoutDimension, multiplier m: CGFloat = 1) -> UIView {
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
    
    func alignCenterX(to anchor: NSLayoutXAxisAnchor, constant c: CGFloat = 0) -> UIView {
        self.centerXAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
    
    func alignCenterY(to anchor: NSLayoutYAxisAnchor, constant c: CGFloat = 0) -> UIView {
        self.centerYAnchor.constraint(equalTo: anchor, constant: c).isActive = true
        return self
    }
}

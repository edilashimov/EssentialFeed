//
//  UIImageView+Animations.swift
//  EssentialFeediOS
//
//  Created by Edil Ashimov on 1/19/22.
//

import UIKit

public extension UIImageView {
    func setImageAnimated(_ newImage: UIImage?) {
        image = newImage
        
        guard newImage != nil else { return }
        
        alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}

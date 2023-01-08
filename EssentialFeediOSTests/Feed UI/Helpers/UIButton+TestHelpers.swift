//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Edil Ashimov on 1/2/22.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}

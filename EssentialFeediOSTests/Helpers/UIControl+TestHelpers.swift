//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Edil Ashimov on 1/2/22.
//

import Foundation

extension UIControl {
     func simulate(event: UIControl.Event) {
         allTargets.forEach { target in
             actions(forTarget: target, forControlEvent: event)?.forEach {
                 (target as NSObject).perform(Selector($0))
             }
         }
     }
 }

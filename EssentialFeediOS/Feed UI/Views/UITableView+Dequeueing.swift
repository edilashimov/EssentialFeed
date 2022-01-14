//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Edil Ashimov on 1/14/22.
//

import UIKit

 extension UITableView {
     func dequeueReusableCell<T: UITableViewCell>() -> T {
         let identifier = String(describing: T.self)
         return dequeueReusableCell(withIdentifier: identifier) as! T
     }
 }

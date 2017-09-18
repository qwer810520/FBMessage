//
//  Extension.swift
//  fbmessenger
//
//  Created by 楷岷 張 on 2017/7/25.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import Foundation
import UIKit


extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
}


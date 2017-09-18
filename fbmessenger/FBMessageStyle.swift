//
//  FBMessageStyle.swift
//  fbmessenger
//
//  Created by 楷岷 張 on 2017/9/17.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import Foundation


class FBMessageStyle {
    static func dateToString(date: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm aa"
        return dateFormatter.string(from: Date(timeIntervalSince1970: date))
    }
}

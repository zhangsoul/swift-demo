//
//  fetchSubString.swift
//  sevendemo
//
//  Created by jujiakeji on 2019/5/20.
//  Copyright © 2019年 Soul. All rights reserved.
//

import Foundation
extension String {
    subscript (r:Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
}

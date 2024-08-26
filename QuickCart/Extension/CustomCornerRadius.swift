//
//  CustomCornerRadius.swift
//  QuickCart
//
//  Created by Neeraj Sharma on 25/08/24.
//

import Foundation
import SwiftUI

struct rounded : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}


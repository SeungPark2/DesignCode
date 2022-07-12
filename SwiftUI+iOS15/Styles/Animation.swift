//
//  Animation.swift
//  SwiftUI+iOS15
//
//  Created by 박승태 on 2022/07/12.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9 )
}

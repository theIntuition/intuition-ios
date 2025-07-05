//
//  Extensions.swift
//  Intuition
//
//  Created by Thakur, Nikunj on 2025-07-04.
//

import SwiftUI

extension View {
    func roundedBorder(color: Color = .gray, width: CGFloat = 1, cornerRadius: CGFloat = 8) -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color, lineWidth: width)
            )
    }
}

//
//  FilterSubmitButtonStyle.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 28/02/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public struct FilterSubmitButtonStyle: ButtonStyle {
    @Environment(\.styles) var styles

    public var color: Color
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(configuration.isPressed ? color.opacity(0.5) : color)
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
            .cornerRadius(10)
            .font(styles.headlineFont)
    }
}

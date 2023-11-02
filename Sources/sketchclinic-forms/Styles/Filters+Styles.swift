//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 19/10/2023.
//

import Foundation

#if canImport(AuroraUI)

import AuroraUI
import SwiftUI
import SketchClinicFoundation

struct FiltersStyles {

    static var textColor: Color = .dariBlack
    static var textInputFont: Font? = .regular(14)
    
    static var choiceSelectionColor: Color = .dariGreenDark
    static var choiceNonSelectionColor: Color = .dim
    static var choiceSelectionFont: Font? = .regular(14)
    static var choiceNonSelectionFont: Font? = .medium(14)

}

#else
import SwiftUI
import SketchClinicFoundation

struct FilterStylesEnvironmentKey: EnvironmentKey {
    static var defaultValue: FiltersStyles = .init()

    typealias Value = FiltersStyles
}

extension EnvironmentValues {
  var styles: FiltersStyles {
    get { self[FilterStylesEnvironmentKey.self] }
    set { self[FilterStylesEnvironmentKey.self] = newValue }
  }
}

struct FiltersStyles {
    var textColor: Color = .textPrimary
    var secondaryTextColor: Color = .textSecondary

    var accentColor: Color = .textPrimary

    var backgroundColor: Color = .backgroundPrimary
    var secondaryBackgroundColor: Color = .backgroundSecondary

    var placeholderColor: Color = .textSecondary
    var borders: Color = .customBorder

    var bodyFont: Font = .bodyFont
    var headlineFont: Font = .headlineFont
    var subheadlineFont: Font = .subHeadlineFont
}

#endif


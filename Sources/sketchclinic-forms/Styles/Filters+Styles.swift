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
    var textColor: Color = .black
    var secondaryTextColor: Color = .gray
    
    var accentColor: Color = .blue

    var backgroundColor: Color = .white
    var secondaryBackgroundColor: Color = .gray

    var placeholderColor: Color = .gray
    var borders: Color = .gray

    var bodyFont: Font = .body
    var headlineFont: Font = .headline
    var subheadlineFont: Font = .subheadline
}

#endif


//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 28/10/2023.
//

import Foundation
import SwiftUI

extension Color {
    static var backgroundPrimary = Color("backgroundPrimary")
    static var backgroundSecondary = Color("backgroundSecondary")

    static var textPrimary = Color("textPrimary")
    static var textSecondary = Color("textSecondary")

    static var customBorder = Color("border")

    static let messageSuccess = Color("messageSuccess")
    static let messageFailure = Color("messageFailure")
    static let messageNotice = Color("messageNotice")
}

enum IBMPlexFontName: String {
    case light = "Light"
    case regular = "Regular"
    case medium = "Medium"
    case semibold = "SemiBold"
    case bold = "Bold"

    func withSize(_ size: CGFloat) -> Font {
        Font.custom("IBMPlexSansArabic-\(self.rawValue)", size: size)
    }
}

extension Font {
    static func app(size: CGFloat, weight: IBMPlexFontName) -> Font {
        weight.withSize(size)
    }
}

extension Font {
    static var largeTitleFont: Font {
        .app(size: 34, weight: .bold)
    }

    static var titleFont: Font {
        .app(size: 28, weight: .bold)
    }

    static var title2Font: Font {
        .app(size: 22, weight: .bold)
    }

    static var title3Font: Font {
        .app(size: 20, weight: .bold)
    }

    static var headlineFont: Font {
        .app(size: 17, weight: .semibold)
    }

    static var bodyFont: Font {
        .app(size: 17, weight: .regular)
    }

    static var subHeadlineFont: Font {
        .app(size: 15, weight: .medium)
    }

    static var footnoteFont: Font {
        .app(size: 13, weight: .regular)
    }
}

struct Paddings {
    static var extraSmall: CGFloat = 4

    static var small: CGFloat = 8

    static var smallX: CGFloat = 12

    static var medium: CGFloat = 16

    static var mediumX: CGFloat = 24

    static var large: CGFloat = 32
}

struct CustomAccentEnvironmentKey: EnvironmentKey {
    static var defaultValue: Color = .textPrimary
}

extension EnvironmentValues {
    var accent: Color {
        get { self[CustomAccentEnvironmentKey.self] }
        set { self[CustomAccentEnvironmentKey.self] = newValue }
    }
}

extension View {
    func accent(_ color: Color) -> some View {
        self.environment(\.accent, color)
    }
}

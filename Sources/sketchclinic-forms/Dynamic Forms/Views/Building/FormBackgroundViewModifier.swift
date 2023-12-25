//
//  FormBackgroundViewModifier.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import SketchClinicFoundation


public struct FormBackgroundViewModifier: ViewModifier {
    @Environment(\.accent) var accent

    var title: String? = nil
    var icon: String? = nil
    var description: String? = nil

    public init(title: String? = nil, icon: String? = nil, description: String? = nil) {
        self.title = title
        self.icon = icon
        self.description = description
    }

    public func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: Paddings.smallX) {
            HStack {
                if let icon, !(title?.trimmed().isEmpty ?? true) {
                    Label(title ?? "", systemImage: icon)
                        .labelStyle(.accentIcon)
                        .font(.headlineFont)
                        .foregroundColor(accent)
                } else {
                    Text(title ?? "")
                        .font(.headlineFont)
                        .foregroundColor(.textPrimary)
                }

                Spacer()
            }

            content
        }
        .cardBackground()
    }
}

extension View {
    public func formBackground(title: String? = nil, icon: String? = nil, description: String? = nil) -> some View {
        modifier(FormBackgroundViewModifier(title: title, icon: icon, description: description))
    }
}

#Preview {
    TextField("Name", text: .constant("Hello"))
        .formBackground(title: "Name")
        .accent(.red)
        .cardIndentionStyle(.tertiary)
}

struct AccentIconLabelStyle: LabelStyle {
    @Environment(\.accent) var accent

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .foregroundColor(accent)
            configuration.title
                .foregroundColor(.textPrimary)
        }
    }
}

extension LabelStyle where Self == AccentIconLabelStyle {
    static var accentIcon: AccentIconLabelStyle { AccentIconLabelStyle() }
}


//
//  FormBackgroundViewModifier.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI


public struct FormBackgroundViewModifier: ViewModifier {
    var title: String? = nil
    var icon: String? = nil
    var description: String? = nil

    public init(title: String? = nil, icon: String? = nil, description: String? = nil) {
        self.title = title
        self.icon = icon
        self.description = description
    }

    public func body(content: Content) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: Paddings.smallX) {
                if !(title?.trimmed().isEmpty ?? true) {
                    Text(title ?? "")
                        .font(.headlineFont)
                        .foregroundColor(.textPrimary)
                }
                
                content
            }
            Spacer()
        }
        .padding(.horizontal, Paddings.medium)
        .padding(.vertical, Paddings.medium)
        .background {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(Color.backgroundSecondary)
        }
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
}

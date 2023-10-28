//
//  FormBackgroundViewModifier.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI


struct FormBackgroundViewModifier: ViewModifier {
    var title: String
    var icon: String? = nil
    var description: String? = nil
    
    func body(content: Content) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: Paddings.smallX) {
                if !title.trimmed().isEmpty {
                    Text(title)
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
    func formBackground(title: String, icon: String? = nil, description: String? = nil) -> some View {
        modifier(FormBackgroundViewModifier(title: title, icon: icon, description: description))
    }
}

#Preview {
    TextField("Name", text: .constant("Hello"))
        .formBackground(title: "Name")
        .accent(.red)
}

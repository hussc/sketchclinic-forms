//
//  FilterItemContainerView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 12/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

public struct FilterItemContainerView: ViewModifier {
    @State private var title: String?
    @State private var icon: String?

    @Environment(\.isRequired) var isRequired
    @Environment(\.accent) var accent
    
    let isSelected: Bool
    let onClear: (() -> Void)?
    
    public init(title: String? = nil,
                icon: String? = nil,
                isSelected: Bool = false,
                onClear: (() -> Void)? = nil) {
        self.title = title
        self.icon = icon
        self.isSelected = isSelected
        self.onClear = onClear
    }
    
    public func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: Paddings.smallX) {
            HStack {
                if let icon, !(title?.trimmed().isEmpty ?? true) {
                    Label(title ?? "", systemImage: icon)
                        .font(.headlineFont)
                        .foregroundColor(accent)
                } else {
                    Text(title ?? "")
                        .font(.headlineFont)
                        .foregroundColor(.textPrimary)
                }

                Spacer()
                
                if let onClear {
                    Button {
                        onClear()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.headlineFont.weight(.medium))
                            .foregroundColor(.textPrimary)
                    }
                }
            }

            content
        }
        .modifier(CardBackgroundView(isSelected: isSelected))
    }
}

extension FilterItemContainerView {
    public struct CardBackgroundView: ViewModifier {
        let isSelected: Bool
        
        @Environment(\.accent) var accent
        
        public func body(content: Content) -> some View {
            HStack {
                content
                Spacer()
            }
            .padding(.horizontal, Paddings.medium)
            .padding(.vertical, Paddings.smallX)
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(isSelected ? accent.opacity(0.1) : .backgroundSecondary)
            }
        }
    }
}

extension View {
    func wrappedInFilterContainer(title: String? = nil, icon: String? = nil) -> some View {
        self.modifier(FilterItemContainerView(title: title, icon: icon))
    }
}

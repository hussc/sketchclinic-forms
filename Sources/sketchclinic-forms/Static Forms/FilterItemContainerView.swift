//
//  FilterItemContainerView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 12/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

public struct FilterItemContainerView<FilterItem: View>: View {
    @State private var title: String?
    
    @Environment(\.isRequired) var isRequired
    @Environment(\.styles) var styles

    @ViewBuilder public var contentView: (() -> FilterItem)
    
    public init(title: String? = nil, contentView: @escaping () -> FilterItem) {
        self.title = title
        self.contentView = contentView
    }
    
    public var body: some View {
        contentView()
            .formBackground(title: title)
            .onPreferenceChange(ElementTitlePreferenceKey.self) {
                self.title = $0
            }
    }
    
    @ViewBuilder func headerView(for title: String) -> some View {
        VStack {
            HStack(alignment: .top, spacing: 2){
                Text(title)
                    .font(styles.headlineFont)
                    .foregroundColor(styles.textColor)
                if isRequired {
                    Image(systemName: "asterisk")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 10, height: 10)
                        .foregroundColor(styles.accentColor)
                }

                Spacer()
            }
        }
    }
}

private struct ElementTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String?
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

extension View {
    func elementTitle(_ title: String?) -> some View {
        preference(key: ElementTitlePreferenceKey.self, value: title)
    }
    
    func wrappedInFilterContainer() -> some View {
        FilterItemContainerView() {
            self
        }
    }
}

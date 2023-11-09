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
    @State private var icon: String?

    @Environment(\.isRequired) var isRequired
    @Environment(\.accent) var accent

    @ViewBuilder public var contentView: (() -> FilterItem)
    
    public init(title: String? = nil, icon: String? = nil, contentView: @escaping () -> FilterItem) {
        self.title = title
        self.icon = icon
        self.contentView = contentView
    }
    
    public var body: some View {
        contentView()
            .formBackground(title: title, icon: icon)
    }
}

extension View {
    func wrappedInFilterContainer(title: String? = nil, icon: String? = nil) -> some View {
        FilterItemContainerView(title: title, icon: icon) {
            self
        }
    }
}

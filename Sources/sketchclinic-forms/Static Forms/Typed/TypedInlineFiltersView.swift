//
//  SwiftUIView.swift
//  
//
//  Created by Hussein AlRyalat on 29/10/2023.
//

import SwiftUI
import SketchClinicFoundation

public struct TypedInlineFiltersView<T: Codable, ContentView: View>: View {
    @StateObject var filterResult: TypedFilterResult<T>
    @Binding var content: T?

    let contentView: () -> ContentView

    public init(content: Binding<T?>, @ViewBuilder contentView: @escaping () -> ContentView) {
        self._content = content
        self._filterResult = .init(wrappedValue: .init(defaultObject: content.wrappedValue))
        self.contentView = contentView
    }

    public var body: some View {
        InlineFiltersView(filterResult: filterResult, content: contentView)
            .onReceive(filterResult.$content, perform: { newValue in
                self.content = newValue
            })
            .onPreferenceChange(FiltersPoolPreferences.self, perform: { value in
                self.filterResult.updatingFiltersPool(from: value)
            })
    }
}

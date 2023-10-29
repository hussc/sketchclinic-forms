//
//  InlineFiltersView.swift
//  Aurora
//
//  Created by Hussein ElRyalat on 06/06/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

public struct InlineFiltersView<Content: View>: View {
    @StateObject private var filterResult: FilterResult
    @ViewBuilder private var filtersFormBuilder: (() -> Content)
    
    public init(filterResult: FilterResult? = nil,
         @ViewBuilder content: @escaping (() -> Content)) {
        self._filterResult = .init(wrappedValue: filterResult ?? .init())
        self.filtersFormBuilder = content
    }
    
    public var body: some View {
        LazyVStack(spacing: 16) {
            filtersFormBuilder()
                .environmentObject(filterResult)
        }
    }
}

extension String {
    func Localized() -> String {
        self
    }
}

#Preview {
    struct MockNumberField: NumberFilterKey {
        var identifier: String { "number" }
        var title: String { "Number" }
        var placeholder: String { "Enter a number" }
    }

    struct MockTextField: TextFilterKey {
        var identifier: String { "text" }
        var title: String { "Text" }
        var placeholder: String { "Enter a text" }
    }

    struct MockToggleField: ToggleFilterKey {
        var identifier: String { "toggle" }
        var title: String? { "Toggle" }
        var text: String { "Toggle here if you agree" }
    }

    struct MockDateField: DateFilterKey {
        var identifier: String { "date" }
        var title: String { "Date" }
        var placeholder: String { "Enter a date" }
    }

    return FiltersView(filterResult: .init(), title: "Filters", completion: { result in

    }) {
        MockNumberField()
        MockTextField()
        MockToggleField()
        MockDateField()
        Spacer()
    }
}

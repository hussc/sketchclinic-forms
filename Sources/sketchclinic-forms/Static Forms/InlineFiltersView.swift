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

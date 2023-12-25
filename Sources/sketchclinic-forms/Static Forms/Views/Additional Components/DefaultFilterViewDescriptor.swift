//
//  DefaultFilterViewDescriptor.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

public struct DefaultFilterViewDescriptor<Key: FilterKey, FilterView: FilterItemView<Key>>: FilterViewDesciptor {
    
    @EnvironmentObject var filtersResult: FilterResult
    
    @State private var hasValue = false
    
    public let title: String?
    public let iconName: String?
    public let key: Key
    public let viewForFilterType: FilterView.Type
    
    public var viewForFilter: FilterView {
        FilterView(key: key)
    }
    
    @ViewBuilder @MainActor public var body: some View {
        viewForFilter
            .onReceive(filtersResult.publisher(for: key), perform: { newValue in
                hasValue = newValue != nil
            })
            .onAppear {
                hasValue = filtersResult[key] != nil
            }
            .modifier(FilterItemContainerView(title: title, icon: iconName, isSelected: hasValue) {
                filtersResult.setValue(value: nil, for: key)
                hasValue = false
            })
    }
}

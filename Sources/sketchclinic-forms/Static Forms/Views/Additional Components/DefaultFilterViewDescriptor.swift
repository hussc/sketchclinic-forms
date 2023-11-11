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
    
    public let title: String?
    public let iconName: String?
    public let key: Key
    public let viewForFilterType: FilterView.Type
    
    public var viewForFilter: FilterView {
        FilterView(key: key)
    }
    
    @ViewBuilder @MainActor public var body: some View {
        viewForFilter
            .wrappedInFilterContainer(title: title, icon: iconName)
    }
}

//
//  FilterViewDescriptor.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 13/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public protocol FilterViewDesciptor<Key>: View {
    associatedtype Key: FilterKey
    associatedtype FilterView: FilterItemView<Key>
        
    @ViewBuilder @MainActor var viewForFilter: Self.FilterView { get }
}

extension FilterViewDesciptor {
    
    /**
     Default implementation wraps the filter with section container
     */
    @ViewBuilder @MainActor public var body: some View {
        viewForFilter
            .wrappedInFilterContainer()
    }
}

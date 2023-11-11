//
//  NumberFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 25/09/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

public protocol NumberFilterKey: FilterKey<Double>, PresentableFilterKey { 
    var minValue: Double { get }
    var maxValue: Double { get }
    var step: Double { get }
}

extension NumberFilterKey {
    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            iconName: iconName,
            key: self,
            viewForFilterType: NumberInputFilterItem.self)
    }
}

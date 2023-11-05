//
//  NumberFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 25/09/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

public protocol NumberFilterKey: FilterKey<Double>, PresentableFilterKey {
    var placeholder: String { get }
}

extension NumberFilterKey {
    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            key: self,
            viewForFilterType: NumberInputFilterItem.self)
    }
}

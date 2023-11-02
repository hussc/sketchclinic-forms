//
//  ToggleFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public protocol ToggleFilterKey: FilterKey<Bool>, PresentableFilterKey {
    
    var text: String { get }
}

extension ToggleFilterKey {
    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            key: self,
            viewForFilterType: ToggleFilterItemView.self
        )
    }
}

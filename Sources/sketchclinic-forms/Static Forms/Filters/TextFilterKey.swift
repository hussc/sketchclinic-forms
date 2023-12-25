//
//  TextFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public enum TextFilterKeyInputType {
    case long
    case normal
}

public protocol TextFilterKey: FilterKey<String>, PresentableFilterKey {
    var placeholder: String { get }
    var inputType: TextFilterKeyInputType { get }
}

extension TextFilterKey {
    public func encode(value: Value, into result: inout [String: Any]) {
        guard !value.isEmpty else {
            result.removeValue(forKey: identifier)
            return
        }
        
        result[identifier] = value.encodedValueForFilter()
    }
    
    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            iconName: iconName,
            key: self,
            viewForFilterType: TextInputFilterItem.self)
    }
    
    public var inputType: TextFilterKeyInputType {
        .normal
    }
}

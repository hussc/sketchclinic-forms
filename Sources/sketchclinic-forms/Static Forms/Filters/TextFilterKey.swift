//
//  TextFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI

public protocol TextFilterKey: FilterKey<String>, PresentableFilterKey {
    var placeholder: String { get }
    var keyboardType: UIKeyboardType? { get }
    var textAlignment: TextAlignment { get }
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
            key: self,
            viewForFilterType: TextInputFilterItem.self)
    }
}

extension TextFilterKey {    
    public var keyboardType: UIKeyboardType? { .default }
    public var textAlignment: TextAlignment { .leading }
}


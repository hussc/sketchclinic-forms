//
//  FilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 11/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI

///  A Filter key is a key for filtering a content bounded to a specific value produced and stored inside the **FilterResult**
///  A key should be a lightweight value type that can be created and destroyed without side effects
///  In general, you should not add any implementation other than the required values by the field type
public protocol FilterKey<Value> {
    associatedtype Value: FilterValueEncodable, Encodable
    
    /// An identifier for a filter key is a unique identifing string, clients should assume that the key is globally unique can be sent to external communications
    var identifier: String { get }
    
    /// A filter key can optionally specify custom encoding for the given key
    /// Default implementation encodes the value into FilterValueEncodable representation
    /// and injects it into the result
    func encode(value: Value, into result: inout [String: Any])
    
}

extension FilterKey {
    public func encode(value: Value, into result: inout [String: Any]) {
        result[self.identifier] = value.encodedValueForFilter()
    }
}

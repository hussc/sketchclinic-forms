//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 29/09/2023.
//

import Foundation
import SwiftUI

public struct FilterItem<Key: FilterKey>: Encodable {
    public let key: Key
    public let value: Key.Value?
    
    public init(key: Key, value: Key.Value?) {
        self.key = key
        self.value = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

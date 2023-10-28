//
//  AnyFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 13/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation

/**
 Type erasing struct for the FilterKey
 */
public struct AnyFilterKey: Hashable {
    public let identifier: String
    public let base: Any
    public let typeName: Any.Type
    
    private var encodeClousure: ((Any, inout [String: Any]) -> Void)
    
    public init<Key>(key: Key) where Key: FilterKey {
        self.base = key
        self.identifier = key.identifier
        self.typeName = Key.self
        
        self.encodeClousure = { value, dict in
            key.encode(value: value as! Key.Value, into: &dict)
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: AnyFilterKey, rhs: AnyFilterKey) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    public func encode(value: Any, into result: inout [String: Any]) {
        self.encodeClousure(value, &result)
    }
}

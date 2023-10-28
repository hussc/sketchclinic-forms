//
//  FilterItemStorage.swift
//  Aurora
//
//  Created by Hussein ElRyalat on 06/06/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public protocol FilterItemStorage: ObservableObject {
    func setValue<Key: FilterKey>(value: Key.Value?, for key: Key)
    
    func value<Key: FilterKey>(for key: Key) -> Key.Value?
        
    func publisher<Key: FilterKey>(for key: Key) -> AnyPublisher<Key.Value?, Never>
}

public class SingleFilterItemStorage<OrKey: FilterKey>: FilterItemStorage {
    @Published public var value: OrKey.Value?
    
    public func setValue<Key>(value: Key.Value?, for key: Key) where Key : FilterKey {
        self.value = value as? OrKey.Value
    }
    
    public func value<Key>(for key: Key) -> Key.Value? where Key : FilterKey {
        return value as? Key.Value
    }
    
    public func publisher<Key>(for key: Key) -> AnyPublisher<Key.Value?, Never> where Key : FilterKey {
        return self.$value.map { $0 as? Key.Value }.eraseToAnyPublisher()
    }
}

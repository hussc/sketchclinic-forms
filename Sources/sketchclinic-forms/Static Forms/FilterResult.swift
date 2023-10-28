//
//  FilterResult.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 11/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class FilterResult: FilterResultProtocol, ObservableObject {
    public private(set) var previousStorage: [AnyFilterKey: FilterValueEncodable]?
    
    @Published public private(set) var storage: [AnyFilterKey: FilterValueEncodable] = [:]
    @Published public private(set) var defaultStorage: [AnyFilterKey: FilterValueEncodable] = [:]
    @Published public private(set) var isContentFiltered: Bool = false
    
    public var isEmpty: Bool {
        if storage.isEmpty { return true }
        if !storage.isEmpty && defaultStorage.isEmpty { return false }
        
        // now we need to check each indivisual key/value for equality between the storage and the default storage
        for element in storage {
            if let defaultElement = defaultStorage[element.key] {
                
                // if values for the same key aren't equal, then immedietly return false, thanks to swift existantial types :)
                if !areEqual(first: defaultElement.encodedValueForFilter(), second: element.value.encodedValueForFilter()) {
                    return false
                }
            } else {
                
                // because we have a key in the storage that isn't in the default storage, which means this is a newly added key
                return false
            }
        }
        
        // otherwise, it's empty
        return true
    }
    
    public init(defaultStorageRegisteration: ((FilterResult) -> Void)? = nil) {
        defaultStorageRegisteration?(self)
        self.storage = defaultStorage
    }
    
    public func value<Key: FilterKey>(for key: Key) -> Key.Value? {
        storage[.init(key: key)] as? Key.Value
    }
    
    public func setValue<Key: FilterKey>(value: Key.Value?, for key: Key) {
        guard let value else {
            self.storage.removeValue(forKey: .init(key: key))
            return
        }
        
        self.storage[.init(key: key)] = value
        isContentFiltered = !isEmpty
    }
    
    public func setDefaultValue<Key: FilterKey>(value: Key.Value?, for key: Key) {
        guard let value else {
            self.defaultStorage.removeValue(forKey: .init(key: key))
            return
        }
        
        self.defaultStorage[.init(key: key)] = value
        
        if storage[.init(key: key)] == nil {
            self.setValue(value: value, for: key)
        }
        
        isContentFiltered = !isEmpty
    }
    
    public func defaultValue<Key: FilterKey>(for key: Key) -> Key.Value? {
        defaultStorage[.init(key: key)] as? Key.Value
    }
    
    public func clearFilters() {
        previousStorage = storage
        storage = defaultStorage
        NotificationCenter.default.post(name: filtersShouldbeClearedNotification, object: nil)
        isContentFiltered = !isEmpty
    }
    
    public func undoClearIfNeeded() {
        if let previousStorage {
            self.storage = previousStorage
        }
        
        isContentFiltered = !isEmpty
    }
    
    public func clearPreviousSnapshot() {
        self.previousStorage = nil
        isContentFiltered = !isEmpty
    }
    
    public func dictionaryRepresentation() -> [String: Any] {
        var initialResult: [String: Any] = [:]
        for element in self.storage {
            element.key.encode(value: element.value, into: &initialResult)
        }
        
        return initialResult
    }
    
    public func key<Key: FilterKey>(for identifier: String, type: Key.Type = Key.self) -> Key? {
        self.storage.keys.first {
            $0.identifier == identifier && type == $0.typeName
        } as? Key
    }
    
    public func publisher<Key: FilterKey>(for key: Key) -> AnyPublisher<Key.Value?, Never> {
        self.$storage
            .compactMap { dict in
                Array(dict.keys)
                    .filter { $0.identifier == key.identifier }
                    .compactMap { $0.base as? Key }
                    .first
            }
            .map { self.value(for: $0) }
            .eraseToAnyPublisher()
    }
    
    /*
     Adds the contents of the rhs to the contents of the lhs, in case of conflicts, the given filter result will have the priority, but the default filters of the original filter result will be used in case of conflicts between two defaults.
     
     the given filters will not be modified and the original filters are used and returned instead.
     */
    @discardableResult
    public func merging(_ filters: FilterResult) -> FilterResult {
        // add the default keys first
        for element in filters.defaultStorage {
            if self.defaultStorage[element.key] == nil {
                self.defaultStorage[element.key] = element.value
                if self.storage[element.key] == nil {
                    self.storage[element.key] = element.value
                }
            }
        }
        
        // now try to merge the values
        for element in filters.storage {
            self.storage[element.key] = element.value
        }
        
        isContentFiltered = !isEmpty
        return self
    }
}

extension Equatable {
    fileprivate func isEqual(_ other: any Equatable) -> Bool {
        guard let other = other as? Self else {
            return other.isExactlyEqual(self)
        }
        return self == other
    }
    
    fileprivate func isExactlyEqual(_ other: any Equatable) -> Bool {
        guard let other = other as? Self else {
            return false
        }
        return self == other
    }
}

fileprivate func areEqual(first: Any, second: Any) -> Bool {
    guard
        let equatableOne = first as? any Equatable,
        let equatableTwo = second as? any Equatable
    else { return false }
    
    return equatableOne.isEqual(equatableTwo)
}

public func +(lhs: FilterResult, rhs: FilterResult) -> FilterResult {
    lhs.merging(rhs)
}

//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 29/09/2023.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

var filtersShouldbeClearedNotification = NSNotification.Name("FiltersShouldBeCleared")

public protocol FilterResultProtocol {
    
    /**
     returns the value for the given key, the value should be as specified originally in the key
     */
    func value<Key: FilterKey>(for key: Key) -> Key.Value?
    
    /**
     Updates the value for the given key, supplying null values means removing the value totally
     */
    func setValue<Key: FilterKey>(value: Key.Value?, for key: Key)
    
    /**
     Returns the stored value for the given key
     */
    func defaultValue<Key: FilterKey>(for key: Key) -> Key.Value?
    
    /**
     Sets a default value for the given key
     */
    func setDefaultValue<Key: FilterKey>(value: Key.Value?, for key: Key)
    
    /**
    returns the key with the given identifier and type, if the same type is found then the key is returned, you can then safetly get it's value by calling valueForKey
     */
    func key<Key: FilterKey>(for identifier: String, type: Key.Type) -> Key?
}

extension FilterResultProtocol {
    public func binding<Key: FilterKey>(for key: Key, defaultValue: Key.Value) -> Binding<Key.Value> {
        .init {
            self.value(for: key) ?? defaultValue
        } set: { newValue in
            self.setValue(value: newValue, for: key)
        }
    }
    
    public func binding<Key: FilterKey>(for key: Key) -> Binding<Key.Value?> {
        .init {
            self.value(for: key)
        } set: { newValue in
            self.setValue(value: newValue, for: key)
        }
    }
    
    public subscript<Key: FilterKey>(key: Key) -> Key.Value? {
        get {
            value(for: key)
        }
        set {
            setValue(value: newValue, for: key)
        }
    }
    
    public subscript<Key: FilterKey>(default defaultKey: Key) -> Key.Value? {
        get { defaultValue(for: defaultKey) }
        set { setDefaultValue(value: newValue, for: defaultKey) }
    }
}


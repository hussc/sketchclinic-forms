//
//  ValueBasedFormItemProtocol.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public protocol ValueBasedFormItemProtocol: FormItemProtocol {
    associatedtype ValueType: Codable
    
    var defaultValue: ValueType? { get set }
    
    /**
     Values should always be nullable,
     */
    var value: ValueType? { get set }
}

extension ValueBasedFormItemProtocol {
    public func withDefaultValue(_ defaultValue: ValueType) -> Self {
        var copy = self
        copy.defaultValue = defaultValue
        return copy
    }
    
    public func withValue(_ value: ValueType) -> Self {
        var copy = self
        copy.value = value
        return copy
    }
}

#if canImport(SwiftUI)
import SwiftUI
public func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
#endif

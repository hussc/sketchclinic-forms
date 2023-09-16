//
//  NumberFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public struct NumberFormItem: PlaceholderFormItemProtocol {
    public enum NumberFormat: String, Codable {
        case integer
        case decimal
    }
    
    public static var typeIdentifier: String {
        "number"
    }
    
    public var title: String
    public var order: Int
    public var format: NumberFormat
    public var placeholder: String
    
    public var value: Double = 0
    public var defaultValue: Double? = nil
}

extension NumberFormItem {
    public init(title: String, placeholder: String, format: NumberFormat) {
        self.title = title
        self.order = 0
        self.format = format
        self.placeholder = placeholder
    }
    
    public func defaultValue(_ value: Double) -> Self {
        var copy = self
        copy.defaultValue = value
        return copy
    }
    
    public func format(_ format: NumberFormat) -> Self {
        var copy = self
        copy.format = format
        return copy
    }
}

extension FormItemProtocol {
    public static func number(_ title: String, placeholder: String, format: NumberFormItem.NumberFormat) -> NumberFormItem {
        NumberFormItem(title: title, order: 0, format: format, placeholder: placeholder)
    }
}

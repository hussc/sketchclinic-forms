//
//  NumberFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public struct NumberFormItem: FormItemProtocol {
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

    public var minValue: Double = 0
    public var maxValue: Double = 10
    public var step: Double = 1
    public var value: Double = 0
    public var defaultValue: Double? = nil
}

extension NumberFormItem {
    public init(title: String, minValue: Double, maxValue: Double, step: Double, format: NumberFormat) {
        self.title = title
        self.order = 0
        self.format = format
        self.minValue = minValue
        self.maxValue = maxValue
        self.step = step
    }
    
    public func defaultValue(_ value: Double) -> Self {
        var copy = self
        copy.defaultValue = value
        return copy
    }

    public func minValue(_ min: Double) -> Self {
        var copy = self
        copy.minValue = min
        return copy
    }

    public func maxValue(_ max: Double) -> Self {
        var copy = self
        copy.maxValue = max
        return copy
    }

    public func step(_ step: Double) -> Self {
        var copy = self
        copy.step = step
        return copy
    }

    public func format(_ format: NumberFormat) -> Self {
        var copy = self
        copy.format = format
        return copy
    }
}

extension FormItemProtocol {
    public static func number(_ title: String, minValue: Double, maxValue: Double, step: Double, format: NumberFormItem.NumberFormat) -> NumberFormItem {
        NumberFormItem(title: title, minValue: minValue, maxValue: maxValue, step: step, format: format)
    }
}

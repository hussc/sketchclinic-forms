//
//  DateFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

public struct DateFormItem: FormItemProtocol {
    public var title: String
    public var order: Int
    public var minDate: Date?
    public var maxDate: Date?
    
    public var defaultValue: Date?
    public var value: Date = Date()
    
    public static var typeIdentifier: String {
        "date"
    }
}

extension DateFormItem {
    public init(title: String, minDate: Date? = nil, maxDate: Date? = nil) {
        self.title = title
        self.order = 0
        self.minDate = minDate
        self.maxDate = maxDate
    }
    
    public func minDate(_ date: Date) -> Self {
        var copy = self
        copy.minDate = date
        return copy
    }
    
    public func maxDate(_ date: Date) -> Self {
        var copy = self
        copy.maxDate = date
        return copy
    }
    
    public func defaultValue(_ date: Date) -> Self {
        var copy = self
        copy.defaultValue = date
        return copy
    }
}

extension FormItemProtocol {
    public static func date(_ title: String, minDate: Date? = nil, maxDate: Date? = nil) -> DateFormItem {
        DateFormItem(title: title, order: 0, minDate: minDate, maxDate: maxDate)
    }
}

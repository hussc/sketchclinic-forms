//
//  BooleanFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

public struct BooleanFormItem: PlaceholderFormItemProtocol {
    public var title: String
    public var order: Int
    public var placeholder: String
    
    public var defaultValue: Bool?
    public var value: Bool = false
    
    public static var typeIdentifier: String {
        "boolean"
    }
}

extension BooleanFormItem {
    public init(title: String = "", placeholder: String) {
        self.title = title
        self.order = 0
        self.placeholder = placeholder
    }
    
    public func defaultValue(_ date: Bool) -> Self {
        var copy = self
        copy.defaultValue = date
        return copy
    }
}

extension FormItemProtocol {
    public static func boolean(_ title: String, placeholder: String) -> BooleanFormItem {
        BooleanFormItem(title: title, order: 0, placeholder: placeholder)
    }
}

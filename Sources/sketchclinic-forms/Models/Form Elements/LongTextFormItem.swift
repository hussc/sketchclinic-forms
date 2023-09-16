//
//  LongTextFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import Foundation

public struct LongTextFormItem: PlaceholderFormItemProtocol {
    public var title: String
    public var order: Int
    public var placeholder: String
    
    public var defaultValue: String?
    public var value: String = ""
    
    public static var typeIdentifier: String {
        "long-text"
    }
}

extension LongTextFormItem {
    public init(title: String, placeholder: String) {
        self.title = title
        self.order = 0
        self.placeholder = placeholder
    }
    
    public func defaultValue(_ defaultValue: String) -> Self {
        var copy = self
        copy.defaultValue = defaultValue
        return copy
    }
}

extension FormItemProtocol {
    public static func longText(_ title: String, placeholder: String) -> LongTextFormItem {
        LongTextFormItem(title: title, order: 0, placeholder: placeholder)
    }
}

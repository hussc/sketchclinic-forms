//
//  TextFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

public struct TextFormItem: PlaceholderFormItemProtocol {
    public var title: String
    public var placeholder: String
    public var order: Int
    
    public var defaultValue: String?    
    public var value: String = ""
    
    public static var typeIdentifier: String {
        "text"
    }
}

extension TextFormItem {
    public init(title: String, placeholder: String) {
        self.title = title
        self.order = 0
        self.placeholder = placeholder
    }
    
    public func defaultValue(_ text: String) -> Self {
        var copy = self
        copy.defaultValue = text
        return copy
    }
}

extension FormItemProtocol {
    public static func text(_ title: String, placeholder: String) -> TextFormItem {
        TextFormItem(title: title, placeholder: placeholder, order: 0)
    }
}

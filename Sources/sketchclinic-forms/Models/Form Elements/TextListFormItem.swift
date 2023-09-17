//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 17/09/2023.
//

import Foundation

public struct TextListFormItem: FormItemProtocol, PlaceholderFormItemProtocol {
    public var title: String
    public var order: Int
    public var placeholder: String
    public var defaultValue: [String]?
    public var value: [String] = []
    
    public static var typeIdentifier: String {
        "text-list"
    }
}

extension TextListFormItem {
    public init(title: String, placeholder: String = "") {
        self.title = title
        self.placeholder = placeholder
        self.order = 0
    }
    
    public func defaultValue(_ list: [String]) -> Self {
        var copy = self
        copy.defaultValue = list
        return copy
    }
}

extension FormItemProtocol {
    public static func textList(_ title: String, placeholder: String = "") -> TextListFormItem {
        TextListFormItem(title: title, placeholder: placeholder)
    }
}

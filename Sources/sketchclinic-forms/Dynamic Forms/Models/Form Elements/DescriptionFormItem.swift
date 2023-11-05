//
//  DescriptionFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

public struct DescriptionFormItem: FormItemProtocol {
    public var title: String
    public var order: Int
    public var value: String = ""
    
    public static var typeIdentifier: String {
        "description"
    }
}

extension DescriptionFormItem {
    public init(title: String = "", text: String) {
        self.title = title
        self.value = text
        self.order = 0
    }
    
    public func value(_ value: String) -> Self {
        var copy = self
        copy.value = value
        return copy
    }
}

extension FormItemProtocol {
    public static func description(_ title: String, text: String) -> DescriptionFormItem {
        DescriptionFormItem(title: title, order: 0, value: text)
    }
}

//
//  SingleChoiceFormItem.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation
import CodableWrappers

public struct SingleChoiceFormItem: ChoicesBasedFormItemProtocol, ValueBasedFormItemProtocol {
    public var title: String
    public var order: Int
    public var choices: [FormChoiceItem]
    
    public var defaultValue: FormChoiceItem? = nil
    public var value: FormChoiceItem? = nil
    
    public static var typeIdentifier: String {
        "single-choice"
    }
}

extension SingleChoiceFormItem {
    public init(title: String, @FormChoicesBuilder _ choices: () -> [FormChoiceItem]) {
        self.title = title
        self.order = 0
        self.choices = choices()
    }
    
    public func defaultValue(_ choice: FormChoiceItem) -> Self {
        var copy = self
        copy.defaultValue = choice
        return copy
    }
}

extension FormItemProtocol {
    public static func singleChoice(_ title: String, @FormChoicesBuilder _ choices: () -> [FormChoiceItem]) -> SingleChoiceFormItem {
        SingleChoiceFormItem(title: title, order: 0, choices: choices())
    }
}

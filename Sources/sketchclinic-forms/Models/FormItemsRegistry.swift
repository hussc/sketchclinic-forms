//
//  FormItemType.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

public struct FormItemsRegistry {
    public static var items: [FormItemProtocol.Type] = [
        TextFormItem.self,
        BooleanFormItem.self,
        SingleChoiceFormItem.self,
        MultipleChoicesFormItem.self,
        DateFormItem.self,
        DescriptionFormItem.self,
        NumberFormItem.self,
        LongTextFormItem.self
    ]
}

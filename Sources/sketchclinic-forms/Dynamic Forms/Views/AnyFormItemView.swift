//
//  AnyFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI


public struct AnyFormItemView: View {
    @Binding public var item: FormItemProtocol

    public init(item: Binding<FormItemProtocol>) {
        self._item = item
    }

    public var body: some View {
        switch item {
        case is BooleanFormItem:
            CheckboxFormItemView(item: _item.transformed())
        case is TextFormItem:
            TextInputFormItemView(item: _item.transformed())
        case is SingleChoiceFormItem:
            SingleChoiceFormItemView(item: _item.transformed())
        case is MultipleChoicesFormItem:
            MultipleChoiceFormItemView(item: _item.transformed())
        case is DateFormItem:
            DateInputFormItemView(item: _item.transformed())
        case is DescriptionFormItem:
            DescriptionFormItemView(item: _item.transformed())
        case is NumberFormItem:
            NumberFormItemView(item: _item.transformed())
        case is LongTextFormItem:
            LongTextFormItemView(item: _item.transformed())
        case is TextListFormItem:
            TextListFormItemView(item: _item.transformed())
        default:
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.backgroundSecondary)
                .frame(height: Paddings.mediumX)
        }
    }
}

extension Binding where Value == FormItemProtocol {
    func transformed<NewValue: FormItemProtocol>() -> Binding<NewValue> {
        Binding<NewValue>(
            get: { self.wrappedValue as! NewValue },
            set: { self.wrappedValue = $0  }
        )
    }
}

#Preview {
    AnyFormItemView(item: .constant(DescriptionFormItem(title: "Description Question", text: "This is a description question, it is used to describe the form.")))
}

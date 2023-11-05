//
//  CheckboxFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI

public struct CheckboxFormItemView: FormItemViewProtocol {
    public enum CheckboxStyle {
        case square
        case circle
    }
    
    let style: CheckboxStyle = .square

    @Environment(\.accent) var accent
    @Binding var item: BooleanFormItem
    
    public init(item: Binding<BooleanFormItem>) {
        self._item = item
    }
    
    public var body: some View {
        HStack(spacing: Paddings.small) {
            Image(systemName: item.value ? style.selectedImageName : style.unselectedImageName)
                .symbolRenderingMode(.hierarchical)
                .font(.title2.weight(.medium))
                .foregroundColor(accent)
            Text(item.placeholder)
                .font(.bodyFont)
                .foregroundColor(.textPrimary)
        }
        .formBackground(title: item.title)
        .onTapGesture { item.value.toggle() }
    }
}

#Preview {
    var mockItem = BooleanFormItem(placeholder: "Do you love me")
    mockItem.value = true
    
    return CheckboxFormItemView(item: .constant(mockItem))
        .accent(.messageSuccess)
}

extension CheckboxFormItemView.CheckboxStyle {
    var selectedImageName: String {
        switch self {
        case .square:
            return "checkmark.square.fill"
        case .circle:
            return "checkmark.circle.fill"
        }
    }
    
    var unselectedImageName: String {
        switch self {
        case .square:
            return "square"
        case .circle:
            return "circle"
        }
    }
}

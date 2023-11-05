//
//  DescriptionFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import MarkdownUI

public struct DescriptionFormItemView: FormItemViewProtocol {
    @Binding var item: DescriptionFormItem

    public init(item: Binding<DescriptionFormItem>) {
        self._item = item
    }

    public var body: some View {
        Markdown(item.value)
            .markdownTheme(.defaultTheme)
            .formBackground(title: item.title)
    }
}

#Preview {
    DescriptionFormItemView(item: .constant(.init(title: "Important Notice", text: "This is a description question, it is used to describe the form.")))
}

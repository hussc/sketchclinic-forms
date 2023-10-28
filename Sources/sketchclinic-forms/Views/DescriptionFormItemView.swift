//
//  DescriptionFormItemView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import MarkdownUI


struct DescriptionFormItemView: View {
    @Binding var item: DescriptionFormItem
    
    var body: some View {
        Markdown(item.value)
            .markdownTheme(.defaultTheme)
            .formBackground(title: item.title)
    }
}

#Preview {
    DescriptionFormItemView(item: .constant(.init(title: "Important Notice", text: "This is a description question, it is used to describe the form.")))
}

//
//  FilterSearchBar.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 28/02/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

public struct FilterSearchBar: View {
    @Binding var searchText: String
    var placeholderText: String

    @Environment(\.styles) var styles

    @State private var isFirstResponder = false
    @State private var isEditing = false
    
    @FocusState private var isTextFieldFocused: Bool
    
    var onCommit: (() -> Void)?
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .background(Color.backgroundSecondary)
                .frame(height: 60)
            HStack {
                TextField(placeholderText, text: $searchText, onCommit: {
                    onCommit?()
                })
                .focused($isTextFieldFocused)
                .font(.bodyFont)
                .padding(.horizontal, Paddings.smallX)
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
}

struct FilterSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        FilterSearchBar(searchText: .constant("Hello"), placeholderText: "Search for something")
    }
}

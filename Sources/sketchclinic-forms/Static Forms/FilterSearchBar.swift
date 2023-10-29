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
                .stroke(Color.customBorder, lineWidth: 1)
                .background(Color.white)
                .frame(height: 50)
            HStack {
                TextField(placeholderText, text: $searchText, onCommit: {
                    onCommit?()
                })
                .focused($isTextFieldFocused)
                .font(.bodyFont)
                .padding(.horizontal, 14)
                
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .background(styles.accentColor)
                        .frame(width: 50, height: 50)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .font(.bodyFont)
                }.highPriorityGesture(TapGesture().onEnded({
                    onCommit?()
                }))
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
    
    struct RoundedCorner: Shape {
        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
}

struct FilterSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        FilterSearchBar(searchText: .constant("Hello"), placeholderText: "Search for something")
    }
}

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
            RoundedCorner(radius: 4, corners: .allCorners)
                .stroke(styles.placeholderColor, lineWidth: 1.5)
                .background(Color.white)
                .frame(height: 48)
            HStack {
                TextField(placeholderText, text: $searchText, onCommit: {
                    onCommit?()
                })
                .focused($isTextFieldFocused)
                .font(styles.bodyFont)
                .padding(.horizontal, 14)
                
                Spacer()
                ZStack {
                    RoundedCorner(radius: 4, corners: .allCorners)
                        .stroke(styles.borders, lineWidth: 1.5)
                        .background(styles.accentColor)
                        .frame(width: 48, height: 48)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                }.highPriorityGesture(TapGesture().onEnded({
                    onCommit?()
                }))
            }
        }
        .padding(.horizontal, 16)
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

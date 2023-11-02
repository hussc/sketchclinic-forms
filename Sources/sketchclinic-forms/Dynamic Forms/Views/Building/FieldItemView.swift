//
//  File.swift
//  
//
//  Created by Hussein AlRyalat on 28/10/2023.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

struct FieldItem {
    let identifier: String
    let name: String
    let icon: String?

    init(identifier: String, name: String, icon: String?) {
        self.identifier = identifier
        self.name = name
        self.icon = icon
    }
}

extension FieldItem: View {
    var body: some View {
        Text(name)
    }
}

class FieldItemWithStore {
    let field: FieldItem
    var current: String?

    /**
     Updates the given field item with the given update block,
     the store isn't responsible for updating any external views due to this update.
     */
    let update: (String) async throws -> Void
    let print: ((String) async throws -> Void)?

    init(
        field: FieldItem,
        current: String?,
        update: @escaping (String) async throws -> Void,
        print: ((String) async throws -> Void)? = nil) {
            self.field = field
            self.current = current
            self.update = update
            self.print = print
        }
}

struct FieldItemView: View {
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.accent) var accentColor

    let field: FieldItem
    let store: FieldItemWithStore?

    @Binding private var text: String
    @State private var isEditorPresented = false
    @State private var isPrintPresented = false
    @State private var shouldSubmit = false

    @FocusState var isInputActive: Bool

    init(field: FieldItem, text: Binding<String>) {
        self.field = field
        self.store = nil
        self._text = text
    }

    init(store: FieldItemWithStore) {
        self.store = store
        self.field = store.field
        self._text = .init(get: {
            store.current ?? ""
        }, set: { newValue in
            store.current = newValue
        })
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Paddings.small) {
            titleView
            inlineEditorView
        }
        .padding(.horizontal, Paddings.medium)
        .padding(.vertical, Paddings.medium)
        .background {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.backgroundSecondary)
        }
        .onTapGesture { isEditorPresented = true }
        .multilineTextAlignment(.leading)
    }

    @ViewBuilder
    var titleView: some View {
        if let icon = field.icon {
            Label(field.name, systemImage: icon)
                .font(.headlineFont.bold())
                .foregroundColor(accentColor)
        } else {
            Text(field.name)
                .font(.headlineFont.bold())
                .foregroundColor(accentColor)
        }
    }

    @ViewBuilder
    var inlineEditorView: some View {
        TextField(field.name, text: $text, axis: .vertical)
            .focused($isInputActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        isInputActive = false
                        shouldSubmit = true
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
            .font(.bodyFont)
            .foregroundColor(.textPrimary)
            .lineLimit(3...7)
            .frame(minHeight: 60)
            .disabled(true)
            .onSubmit(of: .text) { shouldSubmit = true }
    }
}

struct FieldItemView_Previews: PreviewProvider {
    static var previews: some View {
        FieldItemView(field: .init(identifier: "", name: "Retina", icon: ""), text: .constant("blah blah blah"))
    }
}

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

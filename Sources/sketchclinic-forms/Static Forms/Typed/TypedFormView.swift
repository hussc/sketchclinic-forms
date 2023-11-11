//
//  TypedFormView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 29/10/2023.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public struct TypedFormView<T: TypedFormType>: View {
    let title: LocalizedStringKey
    let icon: String
    let onCommit: @MainActor @Sendable (T) async throws -> Void

    @State private var isSubmitting: Bool = false
    @State private var content: T?

    public init(initialContent: T? = nil,
         onCommit: @MainActor @Sendable @escaping (T) async throws -> Void
    ) {
        self._content = .init(wrappedValue: initialContent)
        self.title = T.formConfigurations.title
        self.icon = T.formConfigurations.icon
        self.onCommit = onCommit
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Paddings.mediumX) {
            SecondaryScreenHeader(title: title, icon: icon)
            ScrollView {
                TypedInlineFiltersView(content: $content) {
                    T.formContents(for: content)
                }.padding(.horizontal, Paddings.medium)
            }

            BottomBarView {
                Button(T.formConfigurations.submitActionTitle) {
                    guard content != nil else {
                        return
                    }

                    isSubmitting = true
                }
                .buttonStyle(.primary)
                .disabled(content == nil)
                .actionTask(isFiring: $isSubmitting) {
                    guard let content else {
                        return
                    }

                    try await onCommit(content)
                }
            }
        }
    }
}

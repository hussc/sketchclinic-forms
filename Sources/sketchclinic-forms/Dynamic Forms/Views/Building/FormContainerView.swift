//
//  FormView.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import SwiftUI
import SketchClinicFoundation

public struct FormContainerView: View {
    static var defaultIcon = "circle.lefthalf.filled.righthalf.striped.horizontal.inverse"

    public enum SaveMode {
        case draft
        case final
    }
    
    public typealias SaveClousure = (FormContainer, SaveMode) async throws -> Void

    @Environment(\.accent) var accent
    @Environment(\.dismiss) var dismiss
    
    @StateObject var form: FormContainer
    @State var editingStepIndex: Int

    @State private var isLoading = false
    @State private var error: Error? = nil
    
    let save: SaveClousure
    let showsStepsCount: Bool
    let completion: (FormContainer) -> Void

    public init(form: FormContainer, showsStepsCount: Bool = true, save: @escaping SaveClousure, completion: @escaping (FormContainer) -> Void = { _ in }) {
        self.save = save
        self.showsStepsCount = showsStepsCount
        self.completion = completion
        self._form = .init(wrappedValue: form)
        self._editingStepIndex = .init(initialValue: 0)
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Paddings.mediumX) {
            SecondaryScreenHeader(title: "\(form.title)", icon: Self.defaultIcon)

            VStack(alignment: .leading, spacing: Paddings.medium) {
                PageSwitchingView(pages: form.steps, selectedPage: .init(get: {
                    form.steps[editingStepIndex]
                }, set: { step in
                    guard let index = form.steps.firstIndex(where: { $0.id == step.id }) else {
                        return
                    }

                    editingStepIndex = index
                })).padding(.horizontal, Paddings.medium)

                TabView(selection: $editingStepIndex) {
                    ForEach(Array(zip(form.steps.indices, form.steps)), id: \.0) { stepAndIndex in
                        let step = stepAndIndex.1
                        let index = stepAndIndex.0

                        StepView(step: step)
                            .padding(.horizontal, Paddings.medium)
                            .tag(index)
                    }
                }.tabViewStyle(.page(indexDisplayMode: .never))
            }

            BottomBarView {
                Button {
                    // forward to the next step if possible, otherwise save the visit
                    saveAndDismiss(mode: .final)
                } label: {
                    Label("Next", systemImage: "arrow.right")
                        .labelStyle(.trailingIcon)
                }
                .buttonStyle(.primary)
                .isLoading(isLoading)
            }
        }
        .navigationBarBackButtonHidden()
        .animation(.spring, value: form.editingStep)
    }
    
    func saveAndDismiss(mode: SaveMode) {
        saveAnd(mode: mode) {
            completion(form)
        }
    }
    
    func saveAnd(mode: SaveMode = .draft, then: @MainActor @escaping () -> Void) {
        Task { @MainActor in
            isLoading = true
            do {
                try await save(form, mode)
                then()
            } catch {
                self.error = error
            }
            
            isLoading = false
        }
    }
}

extension FormContainerView {
    struct StepView: View {
        @ObservedObject var step: FormStepContainer
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: Paddings.medium) {
                    ForEach($step.fields) {
                        AnyFormItemView(item: $0.item)
                    }
                }
            }.scrollIndicators(.hidden)
        }
    }
}

#Preview {
    return FormContainerView(form: .opthalmology){ _, _ in

    }
}

extension FormStepContainer: ChoiceItem { }

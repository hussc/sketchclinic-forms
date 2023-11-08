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
        VStack {
            VStack(alignment: .leading, spacing: Paddings.mediumX) {
                SecondaryScreenHeader(title: "\(form.editingStep.order + 1). \(form.editingStep.title)", icon: form.editingStep.icon ?? Self.defaultIcon)

                if showsStepsCount {
                    SteppedProgressView(total: form.steps.count, step: form.editingStep.order)
                }

                StepView(step: form.editingStep)
                Spacer()
            }

            BottomBarView {
                Button {
                    // forward to the next step if possible, otherwise save the visit
                    if form.editingStep.order == form.steps.count - 1 {
                        saveAndDismiss(mode: .final)
                    } else {
                        saveAnd {
                            self.form.editingStep = form.steps[form.editingStep.order + 1]
                        }
                    }
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
                }.padding(.horizontal, Paddings.medium)
            }
        }
    }
}

#Preview {
    let step1 = FormStepContainer(title: "Step 1", icon: "", order: 1, fields: [
        DescriptionFormItem(text: "This is a description"),
        
        TextFormItem(title: "Enter your name", placeholder: "Name"),
        BooleanFormItem(placeholder: "Do you love me?")
     ])
    
    let step2 = FormStepContainer(title: "Step 1", icon: "", order: 1, fields: [
        DescriptionFormItem(text: "This is a description"),
        
        BooleanFormItem(placeholder: "Do you love me?"),
        NumberFormItem(title: "Enter your age", placeholder: "Age", format: .integer),
        
        MultipleChoicesFormItem(title: "Pick one of tehse") {
            FormChoiceItem(title: "Hussein", order: 1)
            FormChoiceItem(title: "Hussein 2", order: 2)
            FormChoiceItem(title: "Hussein 3", order: 3)
        }
     ])
    
    let form = FormContainer(id: "mock-form", title: "Mock Form") {
        step1
        step2
    }
    
    return FormContainerView(form: form){ _, _ in
        
    }
}
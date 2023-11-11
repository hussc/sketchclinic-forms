//
//  DynamicChoicesSelectionView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 18/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

/// What we need to add
/// - SearchView if the content exceeded 10 rows
/// - Managing the lifecycle of the content on the screen
public struct DynamicChoicesSelectionView<Choice: ChoiceItem, Content: View>: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var filterResult: FilterResult

    let title: String
    let isMultiSelection: Bool
    
    @State private var originalChoices: [Choice]?
    
    @StateObject var choicesHolder: DynamicChoicesHolder<Choice>
    @Binding var showResultsTitle: String
    
    @State private var searchText: String = ""
    @State private var task: Task<Void, Error>?
    @State private var choices: [Choice] = []
    
    let content: ((DynamicChoicesHolder<Choice>, Choice) -> Content)
    let onDismiss: ((Bool) -> Void)
    
    init(title: String, isMultiSelection: Bool, choicesHolder: DynamicChoicesHolder<Choice>, showResultsTitle: Binding<String>, content: @escaping (DynamicChoicesHolder<Choice>, Choice) -> Content, onDismiss: @escaping (Bool) -> Void) {
        self.title = title
        self.isMultiSelection = isMultiSelection
        self._choicesHolder = .init(wrappedValue: choicesHolder)
        self._showResultsTitle = showResultsTitle
        self.content = content
        self.onDismiss = onDismiss
    }
    
    public var body: some View {
        VStack(spacing: Paddings.medium) {
            TitleView(title: title) {
                onDismiss(false)
                presentationMode.wrappedValue.dismiss()
            }
            .padding(Paddings.medium)

            if choicesHolder.choices.count >= 10 {
                FilterSearchBar(searchText: $searchText, placeholderText: title)
                    .padding(.horizontal, Paddings.medium)
            }
            
            ScrollView {
                ForEach(choices) { choice in
                    content(choicesHolder, choice)
                }
            }
            
            BottomView(showResultsTitle: $showResultsTitle, isMultiSelection: isMultiSelection, onDismiss: onDismiss)
        }.onAppear {
            self.task = Task {
                try await self.choicesHolder.loadChoices(with: filterResult)
            }
        }.onDisappear {
            self.task?.cancel()
        }.onChange(of: choicesHolder.choices) { newValue in
            self.originalChoices = newValue
            self.choices = newValue
            self.searchText = ""
        }.onChange(of: searchText) { newValue in
            if newValue.isEmpty {
                self.choices = originalChoices ?? []
            } else {
                self.choices = originalChoices?.filter { $0.title.lowercased().contains(newValue.lowercased()) } 
                ?? []
            }
        }
    }
}

extension DynamicChoicesSelectionView {
    struct BottomView: View {
        @Environment(\.presentationMode) private var presentationMode
        @Environment(\.styles) var styles

        @Binding var showResultsTitle: String
        
        let isMultiSelection: Bool
        let onDismiss: ((Bool) -> Void)
                
        var body: some View {
            VStack(spacing: 0) {
                HStack(spacing: Paddings.smallX) {

                    if isMultiSelection {
                        Button {
                            onDismiss(false)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Reset")
                        }
                        .buttonStyle(FilterClearButtonStyle(color: styles.textColor))
                        .frame(maxWidth: .infinity)

                        Spacer()
                        Button(showResultsTitle) {
                            onDismiss(true)
                            presentationMode.wrappedValue.dismiss()
                        }
                        .buttonStyle(FilterSubmitButtonStyle(color: styles.accentColor))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                    } else {
                        Button("Apply") {
                            onDismiss(true)
                            presentationMode.wrappedValue.dismiss()
                        }
                        .buttonStyle(FilterSubmitButtonStyle(color: styles.textColor))
                        .frame(height: 50)
                    }

                }
                .padding(.horizontal, Paddings.medium)
                .padding(.vertical, Paddings.medium)
            }
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.backgroundSecondary)
                    .ignoresSafeArea(.all, edges: .bottom)
            }
        }
    }
    
    struct TitleView: View {
        @Environment(\.styles) var styles

        var title: String
        var closeCallback: (() -> (Void))? = nil
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.headlineFont)
                        .foregroundColor(.textPrimary)
                    Spacer()
                }
            }
        }
    }
}

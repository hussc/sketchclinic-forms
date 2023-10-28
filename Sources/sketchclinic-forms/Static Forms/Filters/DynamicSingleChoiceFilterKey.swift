//
//  DynamicSingleChoiceFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 18/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI

public protocol DynamicSingleChoiceFilterKey<Choice>: PresentableFilterKey where Value == Choice {
    associatedtype Choice: ChoiceItem
    
    var placeholder: String { get }
    
    /**
     Provides a way to load the choices, the dynamic holder acts as a view model which will be captured by the filter view for one time to load the choices and subscribe to any change.
     */
    var choicesViewModel: DynamicChoicesHolder<Choice> { get }
}

extension DynamicSingleChoiceFilterKey {
    public func choice(with id: Choice.ID, in filters: FilterResult? = nil) async throws -> Choice? {
        if let value = filters?.value(for: self), value.id == id {
            return value
        }
        
        let viewModel = choicesViewModel
        try await viewModel.loadChoices(with: filters ?? FilterResult())
        
        return viewModel.choices.first(where: { $0.id == id })
    }
}

extension DynamicSingleChoiceFilterKey {
    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            key: self,
            viewForFilterType: DynamicSingleChoiceFilterItemView.self
        )
    }
}

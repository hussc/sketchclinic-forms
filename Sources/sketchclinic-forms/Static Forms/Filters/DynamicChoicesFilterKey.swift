//
//  DynamicChoicesFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 18/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SketchClinicFoundation
import SwiftUI

public protocol DynamicChoicesFilterKey<Choice>: PresentableFilterKey where Value == [Choice] {
    associatedtype Choice: ChoiceItem
    
    var placeholder: String? { get }
    
    /**
     Provides a way to load the choices, the dynamic holder acts as a view model which will be captured by the filter view for one time to load the choices and subscribe to any change.
     */
    func choices(for result: FilterResult) async throws -> [Choice]
}

extension DynamicChoicesFilterKey {
    var placeholder: String? { nil }

    var choicesViewModel: DynamicChoicesHolder<Choice> {
        .init { filters in
            try await self.choices(for: filters)
        }
    }

    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            key: self,
            viewForFilterType: DynamicMultipleChoiceFilterItemView.self
        )
    }
}

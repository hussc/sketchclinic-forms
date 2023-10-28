//
//  DynamicChoicesHolder.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 18/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public final class DynamicChoicesHolder<Choice: ChoiceItem>: ObservableObject {
    public typealias ChoicesLoading = ((FilterResult) async throws -> [Choice])
    
    private var choicesLoading: ChoicesLoading
    
    @Published public private(set) var choices: [Choice] = []

    public init(_ choicesLoading: @escaping ChoicesLoading) {
        self.choicesLoading = choicesLoading
    }

    public func loadChoices(with filterResult: FilterResult) async throws {
        let choices = try await self.choicesLoading(filterResult)
        await MainActor.run {
            self.choices = choices
        }
    }
}

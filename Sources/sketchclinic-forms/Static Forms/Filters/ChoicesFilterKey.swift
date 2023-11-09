//
//  ChoicesFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public protocol ChoicesFilterKey<Choice>: PresentableFilterKey where Value == [Choice] {
    associatedtype Choice: ChoiceItem
    
    var choices: [Choice] { get }
}

extension ChoicesFilterKey {
    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            iconName: iconName,
            key: self,
            viewForFilterType: MultipleChoiceFilterItemView.self
        )
    }
}

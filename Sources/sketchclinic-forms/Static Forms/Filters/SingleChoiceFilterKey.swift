//
//  SingleChoiceFilterKey.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 16/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public protocol SingleChoiceFilterKey<Choice>: PresentableFilterKey where Value == Choice {
    associatedtype Choice: ChoiceItem
    
    var choices: [Choice] { get }
}

extension SingleChoiceFilterKey {
    public var body: some View {
        DefaultFilterViewDescriptor(
            title: title,
            key: self,
            viewForFilterType: SingleChoiceFilterItemView.self
        )
    }
}

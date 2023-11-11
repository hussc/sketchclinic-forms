//
//  TypedFormConfigurations.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 29/10/2023.
//

import Foundation
import SwiftUI

public struct TypedFormConfigurations {
    var title: LocalizedStringKey
    var icon: String
    var submitActionTitle = "Submit"

    public init(title: LocalizedStringKey, icon: String, submitActionTitle: String = "Submit") {
        self.title = title
        self.icon = icon
        self.submitActionTitle = submitActionTitle
    }
}

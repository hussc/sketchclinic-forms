//
//  TypedFormType.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 29/10/2023.
//

import Foundation
import SwiftUI

public protocol TypedFormType: Codable {
    associatedtype Body: View

    static var formConfigurations: TypedFormConfigurations { get }

    @ViewBuilder static func formContents(for item: Self?) -> Body
}

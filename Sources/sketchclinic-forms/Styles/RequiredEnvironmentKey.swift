//
//  RequiredEnvironmentKey.swift
//  Aurora
//
//  Created by Hussein ElRyalat on 06/06/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import SwiftUI
import SketchClinicFoundation

private struct IsRequiredEnvironmentKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    public var isRequired: Bool {
        get { self[IsRequiredEnvironmentKey.self] }
        set { self[IsRequiredEnvironmentKey.self] = newValue }
    }
}


extension View {
    public func filterRequired(_ isRequired: Bool) -> some View {
        self.environment(\.isRequired, isRequired)
    }
}

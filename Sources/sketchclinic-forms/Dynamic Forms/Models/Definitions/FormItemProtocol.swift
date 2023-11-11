//
//  FormItemProtocol.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation
import SwiftUI
import SketchClinicFoundation

public protocol FormItemProtocol: Codable, FormTypeIdentifiable {
    var title: String { get set }
    var order: Int { get set }
}

extension FormItemProtocol {
    public var id: String { title }
    
    public var type: String { Self.typeIdentifier }
}

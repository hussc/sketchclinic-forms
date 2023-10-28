//
//  FormTypeIdentifiable.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 15/09/2023.
//

import Foundation

public protocol FormTypeIdentifiable {
    
    /**
     This is what identifies each type of form item, it's used to create the correct form item from the server response.
     */
    static var typeIdentifier: String { get }
}

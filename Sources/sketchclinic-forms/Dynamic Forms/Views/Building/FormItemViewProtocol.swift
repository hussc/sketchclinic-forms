//
//  FormItemViewProtocol.swift
//  sketchclinic-ui
//
//  Created by Hussein AlRyalat on 16/09/2023.
//

import SwiftUI


public protocol FormItemViewProtocol: View {
    associatedtype Item: FormItemProtocol
    
    init(item: Binding<Item>)
}

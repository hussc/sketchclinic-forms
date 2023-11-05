//
//  FilterItemView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 11/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

/**
 When designing the view, don't account for sections or paddings, you only apply the view itself and the parent will take care of the rest.
 */
public protocol FilterItemView<Key>: View {
    associatedtype Key: FilterKey
    
    init(key: Key)
}

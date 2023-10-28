//
//  FilterableContainer.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 07/02/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation

/**
 An object (usually a view model) declares itself as filterable is capable of filtering it's elements based on filter criteria.
 */
public protocol FilterableContainer {
    
    /**
     Returns the current filters applied to the container
     */
    var filters: FilterResult { get }
    
    /**
     Tells the container to filter it's elements given a filter result.
     */
    func filterElements(using filterResult: FilterResult)
}

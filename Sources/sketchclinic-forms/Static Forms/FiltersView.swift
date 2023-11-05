//
//  FilterFormView.swift
//  Aurora
//
//  Created by Hussein AlRyalat on 11/01/2023.
//  Copyright © 2023 Adres. All rights reserved.
//

import Foundation
import SwiftUI

/**
 A filters view is a container for multiple filters, you generally specify when to update the results with new keys and their corrosponding values anytime you want.
 */
public struct FiltersView<ContentView: View>: View {
    @StateObject private var filterResult: FilterResult
    @ViewBuilder private var filtersFormBuilder: (() -> ContentView)
    
    @Environment(\.styles) var styles

    @State private var filtersCleared = false
    
    @State private var isFiltersViewPresented = false
    @State private var showResultsButton: String = "search".Localized()
    var title: String
    
    @Environment(\.presentationMode) private var presentationMode
    
    var completion: ((FilterResult) -> Void)
    
    public init(filterResult: FilterResult? = nil,
                title: String,
                completion: @escaping ((FilterResult) -> Void),
                @ViewBuilder content: @escaping (() -> ContentView)) {
        self._filterResult = .init(wrappedValue: filterResult ?? .init())
        self.title = title
        self.completion = completion
        self.filtersFormBuilder = content
    }
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                navigationView
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        filtersFormBuilder()
                            .environmentObject(filterResult)
                        Color.clear.frame(height: 100)
                    }
                    .padding(.top, 16)
                }
                .overlay(bottomView, alignment: .bottom)
            }
        }
    }
    
    var bottomView: some View {
        VStack {
            Divider()
            HStack {
                Button("Reset Filters") {
                    clearAllFilters()
                }.buttonStyle(FilterClearButtonStyle(color: styles.textColor))
                    .frame(maxWidth: .infinity)
                
                Spacer()
                Button(showResultsButton) {
                    showResults()
                }
                .buttonStyle(FilterSubmitButtonStyle(color: styles.textColor))
                .frame(height: 45)
                .frame(maxWidth: .infinity)
            }.padding()
        }.background(Color.white.edgesIgnoringSafeArea(.bottom))
    }
    
    var navigationView: some View {
        VStack(alignment:.leading){
            Spacer()
            
            HStack {
                Text("Filters")
                    .font(styles.headlineFont)
                    .foregroundColor(styles.textColor)
                Spacer()
                
                Button(action: {
                    self.filterResult.undoClearIfNeeded()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                }
            }.padding([.horizontal], 16)
            
            Spacer()
        }.frame(height:64)
    }
    
    private func clearAllFilters() {
        self.filterResult.clearFilters()
        filtersCleared = true
    }
    
    private func showResults() {
        filterResult.clearPreviousSnapshot()
        
        self.completion(filterResult)
        self.presentationMode.wrappedValue.dismiss()
    }
}

//
//  CustomTabBarContainer.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/7/22.
//

import SwiftUI


struct CustomTabBarContainerView<Content:View>: View {
    //MARK:  PROPERTIES
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
                content
                .ignoresSafeArea()
            
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

//
//  CustomTabBar.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/7/22.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
     tabBarVersion2
            .onChange(of: selection, perform:  { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            })
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .Settings, .Workouts, .Summary
        ]
    
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection:
                    .constant(tabs.first!), localSelection: tabs.first!)
        }
        
    }
}
///JWD:   *******EXTENSIONS*******
extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem)-> some View {
        
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : Color.accentColor)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.3) : Color.clear)
        .cornerRadius(15)
    
    }
    private func switchToTab(tab: TabBarItem) {
           selection = tab
        }
    }

extension CustomTabBarView {
    
    private func tabView2(tab: TabBarItem)-> some View {
        
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.3))
                        .matchedGeometryEffect(id: "tab_pad", in: namespace)
                }
            }
        )
    }
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) {tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.6), radius: 15, x: 0, y:6)
        .padding(.horizontal)
    }
}

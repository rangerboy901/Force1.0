//
//  TabBarView.swift
//  Force1.0
//
//  Created by Joseph William DeWeese on 11/7/22.
//

import SwiftUI

struct TabBarView: View {
    //MARK: PROPERTIES
    @State private var selection: String = "Workouts"
    @State private var tabSelection: TabBarItem = .Workouts
    
    var body: some View {
    //MARK: CUSTOM TAB BAR
        CustomTabBarContainerView(selection: $tabSelection) {
            
            
            SettingsScreen()
                .tabBarItem(tab: .Settings, selection: $tabSelection)
            
          
            WorkoutListScreen()
                .tabBarItem(tab: .Workouts, selection: $tabSelection)
           
            SummaryScreen()
                .tabBarItem(tab: .Summary, selection: $tabSelection)
            
            
        }
    }
}
//MARK:  TAB BAR VIEW EXTENSION
                extension TabBarView {
                    
                    private var defaultTabView: some View{
                        //Tab View..
                        TabView(selection: $selection) {
                            SettingsScreen()
                                .tabItem {
                                    Image(systemName: "figure.highintensity.intervaltraining")
                                    Text("Workouts")
                                }
                            WorkoutListScreen()
                                .tabItem {
                                    Image(systemName: "figure.highintensity.intervaltraining")
                                    Text("Workouts")
                                }
                            SummaryScreen()
                                .tabItem {
                                    Image(systemName: "person.fill")
                                    Text("Summary")
                                }
                        }
                    }
                }
                
                           


//
//  SettingsScreen.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/7/22.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                
                // MARK: SECTION 1: FORCE 02
                GroupBox(label: SettingsLabelView(labelText: "Force O2", labelImage: "dot.radiowaves.left.and.right"), content: {
                    HStack(alignment: .center, spacing: 10, content: {
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(12)
                        
                        Text("Force O2 is the #1 app for tracking workouts without all the form entries and time staking application requirements.   Simple approach and clean experience!")
                            .font(.footnote)
                        
                    })
                })
                .padding()
                
                // MARK: SECTION 2: PROFILE
                GroupBox(label: SettingsLabelView(labelText: "Profile", labelImage: "person.fill"), content: {
                    
                    NavigationLink(
                        destination: SettingsEditTextView(),
                        label: {
                            SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.purple)
                        })
                    
                    NavigationLink(
                        destination: SettingsEditTextView(),
                        label: {
                            SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.purple)
                        })
                    
                    NavigationLink(
                        destination: SettingsEditImageView(),
                        label: {
                            SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.purple)
                        })
                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Sign out", color: Color.purple)
                    
                    
                })
                .padding()
                
                // MARK: SECTION 3: APPLICATION
                GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.yellow)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.yahoo.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.orange)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.bing.com")
                    }, label: {
                        SettingsRowView(leftIcon: "globe", text: "MountainLabDevelopments", color: Color.orange)
                    })
                    
                })
                .padding()
                
                // MARK: SECTION 4: SIGN OFF
                GroupBox {
                    Text("Force O2  was made with intent to grow it with community feedback. \n All Rights Reserved \n MountainLabDevelopments. \n Copyright 2020")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    
                }
                .padding()
                .padding(.bottom, 80)
                
            })
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }

    }
    
    // MARK: FUNCTIONS
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
            .preferredColorScheme(.dark)
    }
}


struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}

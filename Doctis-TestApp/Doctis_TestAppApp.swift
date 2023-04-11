//
//  Doctis_TestAppApp.swift
//  Doctis-TestApp
//
//  Created by Михаил Кулагин on 08.04.2023.
//

import SwiftUI

@main
struct Doctis_TestAppApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(.text)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(.text)]
    } 
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZStack {
                    Color.backgroundMain
                        .edgesIgnoringSafeArea(.all)
                    ContentView()
                        .foregroundColor(.text)
                        .preferredColorScheme(isDarkMode ? .dark : .light)
                }
                .navigationBarHidden(true)
            }
        }
    }
}

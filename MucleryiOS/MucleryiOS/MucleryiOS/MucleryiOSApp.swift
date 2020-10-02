//
//  MucleryiOSApp.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 02.10.20.
//

import SwiftUI
import Firebase

@main
struct MucleryiOSApp: App {
    
    init() {
        FirebaseApp.configure()
      }
    let persistenceController = PersistenceController.shared
    var userInfo = UserInfo()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userInfo)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}


//
//  MucleryIOSPreviewBuildApp.swift
//  MucleryIOSPreviewBuild
//
//  Created by Arthur Siebert on 03.10.20.
//

import SwiftUI

@main
struct MucleryIOSPreviewBuildApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct MucleryIOSPreviewBuildApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

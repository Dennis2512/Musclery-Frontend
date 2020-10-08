//
//  ContentView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 02.10.20.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct ContentView: View {
    @State private var selection = 0
    @State var isLoggedIn = true
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Group {
            if userInfo.isUserAuthenticated == .signedOut{
                CreateAccountView()
            } else if userInfo.isUserAuthenticated == .signedIn{
                MainView()
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            self.userInfo.configureFirebaseStateDidChange()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

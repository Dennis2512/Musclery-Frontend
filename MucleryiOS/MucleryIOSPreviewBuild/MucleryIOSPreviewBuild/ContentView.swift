//
//  ContentView.swift
//  MucleryIOSPreviewBuild
//
//  Created by Arthur Siebert on 03.10.20.
//

import SwiftUI
//import Firebase
//import FirebaseAuth
struct ContentView: View {
    @State private var selection = 0
    @State var isLoggedIn = true
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Group {
            //if userInfo.isUserAuthenticated == .signedOut{
                if false {
                //LoginView()
            //} else if userInfo.isUserAuthenticated == .signedIn{
            } else if true {
                VStack {
                    TabView(selection: $selection){
                        CalTrackView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "flame")
                                    Text("CalTrack")
                                }
                            }
                            .tag(0)
                        SportView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "figure.walk")
                                    Text("Sport")
                                }
                            }
                            .tag(1)
                        AnalyseView()
                        .tabItem {
                            VStack {
                                Image(systemName: "waveform.path.ecg.rectangle")
                                Text("Analyse")
                            }
                        }
                        .tag(2)
                        SettingsView()
                        .tabItem {
                            VStack {
                                Image(systemName: "gear")
                                Text("Settings")
                            }
                        }
                        .tag(3)
                    }
                    .accentColor(.black)
                }
            } else {
                Text("Loading...")
            }
        }
        //.onAppear {
          //  self.userInfo.configureFirebaseStateDidChange()
        //}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  MainView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 08.10.20.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 0
    var body: some View {

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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

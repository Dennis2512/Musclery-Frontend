//
//  SettingsView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 02.10.20.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    func signOut(){
        FBAuth.logout { (result) in
            print("logged out")
        }
        self.userInfo.isUserAuthenticated = .signedOut
        
    }
    var body: some View {
        Group {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                //Header
                Rectangle()
                    .frame(height: /*@START_MENU_TOKEN@*/85.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .offset(y: -50)
                    .overlay(
                        Text("Settings")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .offset(y: -30)
                    )
                NavigationView{
                    //ScrollView
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            //personal data
                            NavigationLink(
                                destination: PersonalSettingsView(),
                                label: {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .border(Color.gray, width: 0.5)
                                        .frame(width: 450.0, height: 50.0)
                                        .overlay(HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 245, content: {
                                            Text("Personal Data")
                                                .foregroundColor(.black)
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.black)
                                        }))
                                })
                                .padding(.bottom, -9.0)
                                .padding(.top, 0.0)
                            //Profile
                            NavigationLink(
                                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                                label: {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .border(Color.gray, width: 0.5)
                                    .frame(width: 450.0, height: 50.0)
                                    .overlay(HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 312.0, content: {
                                        Text("Profil")
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                    }))
                            })
                            .padding(.bottom, -9.0)
                            .padding(.top, 0.0)
                            NavigationLink(
                                destination: BMIView(),
                                label: {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .border(Color.gray, width: 0.5)
                                    .frame(width: 450.0, height: 50.0)
                                    .overlay(HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 322.0, content: {
                                        Text("BMI")
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                    }))
                            })
                            .padding(.bottom, -9.0)
                            .padding(.top, 0.0)
                            
                            
                        })
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            //Logout
                            Button(action: signOut) {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .border(Color.gray, width: 0.5)
                                    .frame(width: 450.0, height: 50.0)
                                    .overlay(HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 283.0, content: {
                                        Text("Log out")
                                            .foregroundColor(.red)
                                        Image(systemName: "delete.right")
                                            .foregroundColor(.red)
                                    }))
                            }
                            .padding(.bottom, -9.0)
                            .padding(.top, 0.0)
                        })
                        
                    })
                    //.offset(y: -58) nav fehler
                }
                .offset(y: -58)
            })
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

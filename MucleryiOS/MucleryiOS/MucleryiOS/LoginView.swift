//
//  LoginView.swift
//  gettingInk
//
//  Created by Arthur Siebert on 04.10.20.
//  Copyright © 2020 Arthur Siebert. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var isSuccessful = false
    @EnvironmentObject var userInfo: UserInfo
    
    @State var user: UserViewModel = UserViewModel()
    @State private var showAlert = false
    @State private var authError: EmailAuthError?
    func login() {
        self.userInfo.isUserAuthenticated = .signedIn
    }
    func forgotPassword() {
        isShown = true
    }
    
    @State private var isShown = false
    var body: some View {
        
        ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
            Image("background")
                .frame(width: 420.0, height: 917.0)
                .blur(radius: 8)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                //Logo
                Spacer()
                Image("VANCE")
                Spacer()
                //Form
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .frame(width: 360.0, height: 100.0)
                    .opacity(0.5)
                    //.blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .overlay(VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        TextField("Email", text: self.$user.email)
                            .foregroundColor(.black)
                            .frame(width: 340)
                            .keyboardType(.emailAddress)
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .frame(height: 0.5)
                        SecureField("Password", text: self.$user.password)
                            .frame(width: 340)
                    }))
                //Button
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 130, content: {
                    Button(action: forgotPassword) {
                        ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                            Text("")
                                .font(.footnote)
                        })
                        
                        
                    }
                    Button(action: forgotPassword) {
                        Text("Forgot password")
                            .font(.footnote)
                    }.sheet(isPresented: $isShown, content: {
                        ForgotPasswordView()
                    })
                })
                

                Button(action: {
                    FBAuth.authenticate(withEmail: self.user.email, password: self.user.password) { (result) in
                        switch result {
                        case .failure(let error):
                            self.authError = error
                            self.showAlert = true
                        case .success(_):
                            print("signed in")
                        }
                    }
                }) {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(width: 360.0, height: 50)
                        .foregroundColor(.black)
                        .overlay(Text("Login")
                                    .foregroundColor(.white))
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()

            })
            .alert(isPresented: $showAlert){
                Alert(title: Text("Error"), message: Text(self.authError?.localizedDescription ?? "Unknown error"), dismissButton: .default(Text("ok")){
                    if self.authError == .incorrectPassword {
                        self.user.password = ""
                    } else {
                        self.user.password = ""
                        self.user.email = ""
                    }
                })
            }
        })
        

        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

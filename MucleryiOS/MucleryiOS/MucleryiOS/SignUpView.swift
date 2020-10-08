//
//  SignUpView.swift
//  gettingInk
//
//  Created by Arthur Siebert on 26.09.20.
//  Copyright © 2020 Arthur Siebert. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var showError = false
    @State private var errorString = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                Image("background")
                    .frame(width: 420.0, height: 917.0)
                    .blur(radius: 8)
                VStack {
                    Spacer()
                    Spacer()
                    Group {
                        VStack(alignment: .leading) {
                            TextField("Name", text: self.$user.fullname)
                                .autocapitalization(.words)
                                .frame(width: 360)
                                .cornerRadius(25)
                                .opacity(0.5)
                            if !user.validNameText.isEmpty {
                                Text(user.validNameText).font(.caption).foregroundColor(.red)
                            }
                        }
                        VStack(alignment: .leading) {
                            TextField("Email Address", text: self.$user.email).autocapitalization(.none).keyboardType(.emailAddress)
                                .frame(width: 360)
                                .cornerRadius(25)
                                .opacity(0.5)
                            if !user.validEmailAddressText.isEmpty {
                                Text(user.validEmailAddressText).font(.caption).foregroundColor(.red)
                            }
                        }
                        VStack(alignment: .leading) {
                            SecureField("Password", text: self.$user.password)
                                .frame(width: 360)
                                .cornerRadius(25)
                                .opacity(0.5)
                            if !user.validPasswordText.isEmpty {
                                Text(user.validPasswordText).font(.caption).foregroundColor(.red)
                            }
                        }
                        VStack(alignment: .leading) {
                            SecureField("Confirm Password", text: self.$user.confirmPassword)
                                .frame(width: 360)
                                .cornerRadius(25)
                                .opacity(0.5)
                            if !user.passwordsMatch(_confirmPW: user.confirmPassword) {
                                Text(user.validConfirmPasswordText).font(.caption).foregroundColor(.red)
                            }
                        }
                    }.frame(width: 300)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    VStack(spacing: 20 ) {
                        Button(action: {
                            FBAuth.createUser(withEmail: self.user.email, name: self.user.fullname, password: self.user.password) { (result) in
                                switch result {
                                case .failure(let error):
                                    self.errorString = error.localizedDescription
                                    self.showError = true
                                case .success(_):
                                    print("Account successfully created")
                                }
                            }
                            
                        }) {
                            Text("Register")
                                .frame(width: 360)
                                .padding(.vertical, 15)
                                .background(Color.black)
                                .cornerRadius(25)
                                .foregroundColor(.white)
                                .opacity(user.isSignInComplete ? 1 : 0.75)
                        }
                        .disabled(!user.isSignInComplete)
                        Spacer()
                    }.padding()
                }.padding(.top)
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text(self.errorString), dismissButton: .default(Text("ok")))
                }
                .offset(y: 250)
            })
                .navigationBarTitle("Sign Up", displayMode: .inline)
            .navigationBarItems(trailing: Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                    
                })
        }
        
    }
//}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
}

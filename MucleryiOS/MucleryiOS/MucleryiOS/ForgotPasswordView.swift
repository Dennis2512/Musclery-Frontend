//
//  ForgotPasswordView.swift
//  gettingInk
//
//  Created by Arthur Siebert on 04.10.20.
//  Copyright © 2020 Arthur Siebert. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var user: UserViewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var errString: String?
    var body: some View {
        NavigationView {
            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                Image("background")
                    .frame(width: 420.0, height: 917.0)
                    .blur(radius: 8)
                VStack {
                    Spacer()
                    TextField("Enter email address", text: $user.email).autocapitalization(.none).keyboardType(.emailAddress).foregroundColor(.gray).cornerRadius(25).opacity(0.5)
                    Button(action: {
                        FBAuth.resetPassword(email: self.user.email) { (result) in
                            switch result {
                            case .failure(let error):
                                self.errString = error.localizedDescription
                            case .success(_):
                                break
                            }
                            self.showAlert = true
                        }
                    }) {
                        Text("Reset")
                            .frame(width: 360)
                            .padding(.vertical, 15)
                            .background(Color.black)
                            .cornerRadius(25)
                            .foregroundColor(.white)
                            .opacity(user.isEmailValid(_email: user.email) ? 1 : 0.75)
                    }
                    .disabled(!user.isEmailValid(_email: user.email))
                    Spacer()
                    Spacer()
                }.padding(.top)
                    .frame(width: 300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                .navigationBarTitle("Reset Password", displayMode: .inline)
                    .navigationBarItems(trailing: Button("Dismiss") {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Reset Password"), message: Text(self.errString ?? "Reset Email has been send."), dismissButton: .default(Text("ok")){
                        self.presentationMode.wrappedValue.dismiss()
                    })
                })
                .offset(y: 100)
            })
            
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

//
//  CreateAccountView.swift
//  gettingInk
//
//  Created by Arthur Siebert on 04.10.20.
//  Copyright © 2020 Arthur Siebert. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct CreateAccountView: View {

    func LoginWithMail() {
        MailFormisShown = true
    }
    @State private var MailFormisShown = false
    func SignUpWithMail() {
        SignUpWithMailIsShown = true
    }
    @State private var SignUpWithMailIsShown = false
    var body: some View {
        ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
            Image("background")
                .frame(width: 420.0, height: 917.0)
                .blur(radius: 8)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(y: -270)
                Group{
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        RoundedRectangle(cornerRadius: 11, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .frame(width: 280.0, height: 30.0)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                            .blur(radius: 0.4)
                            .overlay(
                                Text("Continue with Google")
                                    .foregroundColor(.white)
                            )
                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        RoundedRectangle(cornerRadius: 11, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .frame(width: 280.0, height: 30.0)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                            .blur(radius: 0.4)
                            .overlay(
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Text("Continue with Phone")
                                        .foregroundColor(.white)
                                    Image(systemName: "phone.fill")
                                        .foregroundColor(.white)
                                })
                            )
                    }
                    Button(action: SignUpWithMail) {
                        RoundedRectangle(cornerRadius: 11, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .frame(width: 280.0, height: 30.0)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                            .blur(radius: 0.4)
                            .overlay(
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Text("Continue with Mail")
                                        .foregroundColor(.white)
                                    Image(systemName: "envelope.fill")
                                        .foregroundColor(.white)
                                })
                            )
                    }.sheet(isPresented: $SignUpWithMailIsShown, content: {
                        SignUpView()
                    })
                    Button(action: LoginWithMail) {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                            .frame(width: 196.0, height: 11.0)
                            .foregroundColor(.black)
                            .opacity(1.0)
                            .blur(radius: 11)
                            .overlay(
                        Text("Already have an Account? - Sign In")
                            .font(.caption2)
                            .foregroundColor(.white)
                        )
                    }
                    .sheet(isPresented: $MailFormisShown, content: {
                        LoginView()
                    })
                    .offset(y: 20)
                }
                .offset(y: -50)
                
            })
        })
        
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

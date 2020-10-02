//
//  LoginView.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 02.10.20.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @State var allertMessage = "sad trombone"
    @State var isSuccessful = false
    @EnvironmentObject var userInfo: UserInfo
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.allertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
            }
            else {
                self.isSuccessful = true
                
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    self.isSuccessful = false
                }
                self.userInfo.isUserAuthenticated = .signedIn
            }
        }
    }
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            //Form
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .frame(width: 380.0, height: 100.0)
                .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke()
                            .foregroundColor(.gray)
                            .padding(.top, 0))
                .overlay(VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    TextField("Email", text: $email)
                        .frame(width: 370)
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(height: 0.5)
                    SecureField("Password", text: $password)
                        .frame(width: 370)
                }))
            //Button
            
            Button(action: login) {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .frame(width: 380.0, height: 50)
                    .foregroundColor(.black)
                    .overlay(Text("Login")
                                .foregroundColor(.white))
            }

        })
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

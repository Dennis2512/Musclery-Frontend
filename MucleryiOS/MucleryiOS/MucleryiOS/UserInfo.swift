//
//  UserInfo.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 02.10.20.
//

import Foundation
import Firebase
class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefinded, signedOut, signedIn
    }
    @Published var isUserAuthenticated: FBAuthState = .undefinded
    
    func configureFirebaseStateDidChange(){
        //self.isUserAuthenticated = .signedOut
        
        if Auth.auth().currentUser != nil{
            self.isUserAuthenticated = .signedIn
        } else {
            self.isUserAuthenticated = .signedOut
        }
    }
}

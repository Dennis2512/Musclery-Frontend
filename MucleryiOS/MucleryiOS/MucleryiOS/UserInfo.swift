//
//  UserInfo.swift
//  MucleryiOS
//
//  Created by Arthur Siebert on 02.10.20.
//

import Foundation

class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefinded, signedOut, signedIn
    }
    @Published var isUserAuthenticated: FBAuthState = .undefinded
    
    func configureFirebaseStateDidChange(){
        //self.isUserAuthenticated = .signedOut
        self.isUserAuthenticated = .signedIn
    }
}

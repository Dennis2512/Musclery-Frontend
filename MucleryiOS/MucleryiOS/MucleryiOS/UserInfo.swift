//
//  UserInfo.swift
//  gettingInk
//
//  Created by Arthur Siebert on 04.10.20.
//  Copyright © 2020 Arthur Siebert. All rights reserved.
//

import Foundation
import FirebaseAuth
class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefinded, signedOut, signedIn
    }
    @Published var isUserAuthenticated: FBAuthState = .undefinded
    @Published var user: FBUser = .init(uid: "", name: "", email: "")
    
    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    func configureFirebaseStateDidChange(){
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ (_ , user)  in
            guard let user = user else {
                self.isUserAuthenticated = .signedOut
                return
            }
            self.isUserAuthenticated = .signedIn
//            FBFirestore.retrieveFBUser(uid: user.uid) { (result) in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let user):
//                    self.user = user
//                }
//            }
        })
    }
}

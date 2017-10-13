//
//  AuthService.swift
//  devslopes-chat
//
//  Created by Jean-François Droux on 21.09.17.
//  Copyright © 2017 Droux. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    var username: String?
    var isLoggedIn = false
    
    func emailLogin(_ email: String, password: String, completion: @escaping (_ Success: Bool, _ message: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error)
            in if error != nil {
                if let errorCode = AuthErrorCode(rawValue: (error?._code)!) {
                    if errorCode == .userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
                            if error != nil {
                                completion(false, "Error creating account")
                            } else {
                                completion(true, "Successfully created account")
                            }
                        })
                    } else {
                        completion(false, "Sorry, Incorrect email or password")
                    }
                }
            } else {
                completion(true, "Successfully Logged In")
            }
        })
    }
}

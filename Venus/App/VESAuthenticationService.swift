//
//  VESAuthenticationService.swift
//  Venus
//
//  Created by Jimmy Pham on 7/14/18.
//  Copyright © 2018 tuvans. All rights reserved.
//

import FacebookLogin
import FacebookCore
import FirebaseAuth
import GoogleSignIn

class VESAuthenticationService {
    
    static func facebookLogin(viewController: VESBaseViewController,
                              success: @escaping (AuthDataResult) -> (),
                              failure: @escaping (Error) -> ()) {
        let login = LoginManager()
        login.logIn(readPermissions: [.publicProfile, .email], viewController: viewController) { (facebookResult) in
            switch facebookResult {
            case .failed(let error):
                print(error.localizedDescription)
                login.logOut()
            case .cancelled:
                print("User cancelled login.")
                login.logOut()
            case .success(_, _, let token):
                let credential = FacebookAuthProvider.credential(withAccessToken: token.authenticationToken)
                Auth.auth().signInAndRetrieveData(with: credential, completion: { (authResult, error) in
                    if let error = error {
                        failure(error)
                    } else if let result = authResult {
                        success(result)
                    }
                })
            }
        }
    }
    
    static func googleLogin(_ authentication: GIDAuthentication,
                            success: @escaping (AuthDataResult) -> (),
                            failure: @escaping (Error) -> ()) {
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                failure(error)
            } else if let result = authResult {
                success(result)
            }
        }
    }
    
    static func logout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}

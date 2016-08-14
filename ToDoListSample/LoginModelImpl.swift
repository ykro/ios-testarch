//
//  LoginModelImpl.swift
//  ToDoListSample
//
//  Created by ykro on 8/12/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation


class LoginModelImpl: LoginModel {
    func login(email: String, password: String, completionHandler: (error: NSError?) ->()){
        var error: NSError? = nil
        if email != "a" || password != "b" {
            error = NSError(domain: "Test app",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Invalid Email or Password"])
        }
        completionHandler(error: error)
    }
}


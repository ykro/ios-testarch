//
//  LoginModel.swift
//  ToDoListSample
//
//  Created by ykro on 8/12/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol LoginModel {
    func login(email: String, password: String, completionHandler: (error: NSError?) ->())
}
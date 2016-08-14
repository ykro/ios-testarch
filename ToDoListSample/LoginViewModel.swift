//
//  LoginPresenterProtocol.swift
//  ToDoListSample
//
//  Created by ykro on 8/12/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol LoginViewModelViewDelegate: class {
    func errorMessageDidChange(viewModel: LoginViewModel, message: String)
}

protocol LoginViewModel {
    //var view: LoginView { get set }
    var viewDelegate: LoginViewModelViewDelegate? { get set }

    var model: LoginModel { get set }
    var appRouter: LoginRouter { get set}

    var email: String {get set}
    var password: String {get set}
    
    var errorMessage: String { get }
    func submit(email: String, password: String)
}
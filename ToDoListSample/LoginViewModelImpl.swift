//
//  LoginPresenter.swift
//  ToDoListSample
//
//  Created by ykro on 8/12/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

class LoginViewModelImpl: LoginViewModel {
    var model: LoginModel
    var appRouter: LoginRouter
    
    //var view: LoginView
    weak var viewDelegate: LoginViewModelViewDelegate?
    
    required init(model: LoginModel, appRouter: LoginRouter) {        
        self.model = model
        self.appRouter = appRouter
    }
    
    var email: String = "" {
        didSet {
            print("didset email")
            //inputStatusDidChange?.canSubmitStatusDidChange(self)
        }
    }
    
    var password: String = "" {
        didSet {
            print("didset pass")
            //inputStatusDidChange?.canSubmitStatusDidChange(self)
        }
    }
    
    private(set) var errorMessage: String = "" {
        didSet {
            viewDelegate?.errorMessageDidChange(self, message: errorMessage)
        }
    }
    
    func submit(email: String, password: String){
        //view.disableInputs()
        
        let completionHandler = { (error: NSError?) in
            guard let error = error else {
                //self.view.enableInputs()
                self.appRouter.didLogin()
                return
            }
            //self.view.enableInputs()
            
            self.errorMessage = error.localizedDescription;
            //self.view.failedLogin(error.localizedDescription)
        }
        model.login(email, password: password, completionHandler: completionHandler)
 
    }    
}
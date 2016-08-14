//
//  ViewController.swift
//  ToDoListSample
//
//  Created by ykro on 8/12/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import UIKit

//class LoginViewController: UIViewController, LoginView {
class LoginViewController: UIViewController {
    //var presenter: LoginPresenter?
    
    var viewModel: LoginViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            refreshDisplay()
        }
    }
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtError: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!    
    
    @IBAction func didTapSubmit(sender: AnyObject) {
        viewModel?.submit(txtEmail.text!, password: txtPassword.text!)
    }
    
    private var isLoaded: Bool = false
    
    override func viewDidLoad() {
        isLoaded = true;
        
        txtEmail.addTarget(self, action: #selector(emailFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        txtPassword.addTarget(self, action: #selector(passwordFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        refreshDisplay()
    }
    
    private func refreshDisplay() {
        guard isLoaded else { return }
        
        if let viewModel = viewModel {
            txtEmail.text = viewModel.email
            txtPassword.text = viewModel.password
            txtError.text = viewModel.errorMessage
            btnSubmit.enabled = true
        } else {
            txtEmail.text = ""
            txtPassword.text = ""
            txtError.text = ""
            btnSubmit.enabled = false
        }
    }

    func emailFieldDidChange(textField: UITextField) {
        if let text = textField.text {
            viewModel?.email = text
        }
    }
    
    func passwordFieldDidChange(textField: UITextField) {
        if let text = textField.text {
            viewModel?.password = text
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    /*
    func enableInputs(){}
    func disableInputs(){}
    func failedLogin(error: String){
        txtError.text = error
    }
     */
}


extension LoginViewController : LoginViewModelViewDelegate {        
    func errorMessageDidChange(viewModel: LoginViewModel, message: String) {
        txtError.text = message
    }
}
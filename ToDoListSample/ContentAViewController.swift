//
//  DetailAViewController.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import UIKit

protocol ContentAView {
    var presenter: ContentAPresenter? {get set}
    func setData(content: String)
    func reportError(error: String)
}

class ContentAViewController: UIViewController, ContentAView {
    var presenter: ContentAPresenter?
    
    @IBOutlet weak var txtContent: UITextView!
    @IBAction func didClickedButton(sender: AnyObject) {
        presenter?.backToList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.action()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setData(content: String){
        txtContent.text = content
    }
    
    func reportError(error: String) {
        txtContent.text = error
        txtContent.textColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
    }
}

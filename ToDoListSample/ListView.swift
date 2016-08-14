//
//  ListView.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol ListView {    
    func setData(people: [Person])
    
    func showList()
    func hideList()
    func showProgress()
    func hideProgress()
}
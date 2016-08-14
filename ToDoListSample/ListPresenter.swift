//
//  ListPresenter.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol ListPresenter {
    func getUsers()
    func getUsersAsync()
    func itemClicked(person: Person)
}
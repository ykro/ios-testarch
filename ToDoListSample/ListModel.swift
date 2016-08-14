//
//  ListModel.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol ListModel {
    func syncGet(completionHandler: (people: [Person]) ->())
    func asyncGet(completionHandler: (people: [Person]) ->())
}
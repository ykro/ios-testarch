//
//  RouterContracts.swift
//  ToDoListSample
//
//  Created by ykro on 8/12/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol ListRouter {
    func clickOnItemValueNotSet(person: Person)
    func clickOnItemValueSet(person: Person)
}
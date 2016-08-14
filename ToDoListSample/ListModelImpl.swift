//
//  ListModelImpl.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

class ListModelImpl: ListModel {
    var service: ListService?
    
    func syncGet(completionHandler: (people: [Person]) ->()) {        
        completionHandler(people: (service?.getPeople())!)
    }
    
    func asyncGet(completionHandler: (people: [Person]) ->()) {
        service?.getPeopleAsync(completionHandler)
    }
}
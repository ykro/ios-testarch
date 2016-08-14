//
//  ListService.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

class ListService {
    let people = [Person(name:"Hugsi", email:"h@losositos.com", value: -1),
                  Person(name:"Sordito", email:"orejas@stitch.co", value: 5),
                  Person(name:"Stitchito", email:"favorito@stitch.co", value: -1),
                  Person(name:"Snowballcito", email:"eljefe@gmail.com", value: 10)]
    
    func getPeopleAsync(callBack:([Person]) -> Void){
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            callBack(self.people)
        }
    }
    
    func getPeople() -> [Person] {
        return people
    }
}
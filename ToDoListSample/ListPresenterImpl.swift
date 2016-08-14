//
//  ListPresenterImpl.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

class ListPresenterImpl: ListPresenter {
    var view: ListView?
    var model: ListModel?
    var router: ListRouter?
    
    func getUsers() {
        let completionHandler = {(people: [Person]) in
            print(people)            
            self.view?.setData(people)
        }
        model?.syncGet(completionHandler)
    }
    
    func getUsersAsync(){
        view?.hideList()
        view?.showProgress()
        
        let completionHandler = {(people: [Person]) in
            self.view?.setData(people)
            self.view?.hideProgress()
            self.view?.showList()
        }
        
        model?.asyncGet(completionHandler)
    }
    
    func itemClicked(person: Person) {
        if (person.value != -1) {
            router?.clickOnItemValueSet(person)
        } else {
            router?.clickOnItemValueNotSet(person)
        }
        
    }
}
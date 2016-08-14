//
//  AppRouter.swift
//  ToDoListSample
//
//  Created by ykro on 8/12/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import UIKit

class AppRouter {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        showList()
        //let testPerson = Person(name: "adrian", email: "a@a.com", value: -1)
        //showContent(testPerson, valueSet: true)
    }
    
    func showList(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let view = storyboard.instantiateViewControllerWithIdentifier("list") as? ListViewController {
            let service = ListService()
            let model = ListModelImpl()
            model.service = service
            
            let presenter = ListPresenterImpl()
            presenter.model = model
            presenter.view = view
            presenter.router = self
            
            view.presenter = presenter
            window.rootViewController = view
        }
    }
    
    func showContent(person: Person, valueSet: Bool){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if (valueSet) {
            if let view = storyboard.instantiateViewControllerWithIdentifier("contenta") as? ContentAViewController {
                let model = ContentAModelImpl()
                model.personName = person.name
                
                let presenter = ContentAPresenterImpl()
                presenter.model = model
                presenter.view = view
                presenter.router = self
            
                view.presenter = presenter
                window.rootViewController = view
            }
        } else {
            if let view = storyboard.instantiateViewControllerWithIdentifier("contentb") as? ContentBViewController {
                let model = ContentBModelImpl()
                
                let presenter = ContentBPresenterImpl()
                presenter.model = model
                presenter.view = view
                presenter.router = self
                
                view.presenter = presenter
                window.rootViewController = view
            }
        }
    }
}

extension AppRouter : ListRouter {
    func clickOnItemValueSet(person: Person) {
        showContent(person, valueSet: true)
    }
    
    func clickOnItemValueNotSet(person: Person) {
        showContent(person, valueSet: false)
    }
}

extension AppRouter : ContentRouter {
    func returnToList() {
        showList()
    }
}
//
//  ContentBModel.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol ContentAPresenter {
    var view: ContentAView? { get set }
    var model: ContentAModel? { get set }
    var router: ContentRouter? { get set}
    func action()
    func backToList()
}

class ContentAPresenterImpl: ContentAPresenter {
    var view: ContentAView?
    var model: ContentAModel?
    var router: ContentRouter?

    func action() {
        let completionHandler = { (content: String, error: NSError?) in
            guard let error = error else {
                self.view!.setData(content)
                return
            }
            self.view!.reportError(error.localizedDescription)
        }
        model!.getContent(completionHandler)
    }
    
    func backToList() {
        router!.returnToList()
    }

}


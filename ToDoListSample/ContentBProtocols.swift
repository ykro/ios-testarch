//
//  ContentBProtocols.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol ContentBView {    
    func setData(content: String)
    func reportError(error: String)
}

protocol ContentBPresenter {
    var view: ContentBView? { get set }
    var model: ContentBModel? { get set }
    var router: ContentRouter? { get set}
    func action()
    func backToList()
}

protocol ContentBModel {
    func getContent(completionHandler: (content: String, error: NSError?) ->())
}
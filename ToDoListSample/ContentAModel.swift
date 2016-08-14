//
//  ContentAModel.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

protocol ContentAModel {
    func getContent(completionHandler: (content: String, error: NSError?) ->())
}

class ContentAModelImpl: ContentAModel {
    var personName: String?
    
    func getContent(completionHandler: (content: String, error: NSError?) ->()){
        let content = "Contenido de \(personName!)"
        completionHandler(content: content, error: nil)
    }
}
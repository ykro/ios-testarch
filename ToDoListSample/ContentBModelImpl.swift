//
//  ContentBModelImpl.swift
//  ToDoListSample
//
//  Created by ykro on 8/14/16.
//  Copyright © 2016 Bit & Ik'. All rights reserved.
//

import Foundation

class ContentBModelImpl: ContentBModel {
    func getContent(completionHandler: (content: String, error: NSError?) ->()){
        let error = NSError(domain: "Test app",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Error"])
        completionHandler(content: "", error: error)
    }
}
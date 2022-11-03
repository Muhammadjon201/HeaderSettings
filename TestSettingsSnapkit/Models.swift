//
//  Models.swift
//  TestSettingsSnapkit
//
//  Created by ericzero on 11/2/22.
//

import Foundation

class FullMenu {
    var header: String?
    var information = [Info]()
    
    init(h: String, arr: [Info]) {
        self.header = h
        self.information = arr
//        for item in arr {
//            information.append(item)
//        }
    }
}

class Info {
    
    var image: String?
    var title: String?
    
    init(img: String, tit: String) {
        self.image = img
        self.title = tit
    }
    
}

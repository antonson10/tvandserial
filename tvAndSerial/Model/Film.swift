//
//  Film.swift
//  tvAndSerial
//
//  Created by Anton Chugunov on 03.09.2018.
//  Copyright © 2018 Anton Chugunov. All rights reserved.
//

import Foundation

class Film: NSObject {
    let name: String
    let imageName: String
    let year: Int
    
    init(name: String, imageName: String, year: Int) {
        self.name = name
        self.imageName = imageName
        self.year = year
    }
}

//
//  FilmCompany.swift
//  tvAndSerial
//
//  Created by Anton Chugunov on 03.09.2018.
//  Copyright © 2018 Anton Chugunov. All rights reserved.
//

import Foundation

class FilmCompany: NSObject {
    let name: String
    let films: [Film]
    
    init(name: String, films: [Film]) {
        self.name = name
        self.films = films
    }
}

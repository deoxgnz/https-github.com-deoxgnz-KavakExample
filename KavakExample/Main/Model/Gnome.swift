//  Gnome.swift
//  Created by Daniel Garcia on 7/16/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import Foundation

struct Gnome: Codable {
    var iId            : Int
    var iAge           : Int
    var bFavorite      : Bool
    var dWeight        : Double
    var dHeight        : Double
    var strName        : String
    var strHairColor   : String
    var strThumbnail   : String?
    var arrFriends     : [String]?
    var arrProfessions : [String]?
    
    init() {
        iId = -1
        iAge = 0
        bFavorite = false
        dWeight = 0
        dHeight = 0
        strName = ""
        strHairColor = ""
        strThumbnail = nil
        arrFriends = nil
        arrProfessions = nil
    }
}

//  Gnome.swift
//  Created by Daniel Garcia on 7/16/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import Foundation

struct Gnome: Codable {
    let iId            : Int
    let iAge           : Int
    let bFavorite      : Bool
    let dWeight        : Double
    let dHeight        : Double
    let strName        : String
    let strHairColor   : String
    let strThumbnail   : String?
    let arrFriends     : [String]?
    let arrProfessions : [String]?
}
/*
{
  "id": 0,
  "name": "Tobus Quickwhistle",
  "thumbnail": "http://www.publicdomainpictures.net/pictures/10000/nahled/thinking-monkey-11282237747K8xB.jpg",
  "age": 306,
  "weight": 39.065952,
  "height": 107.75835,
  "hair_color": "Pink",
  "professions": [
    "Metalworker",
    "Woodcarver",
    "Stonecarver",
    " Tinker",
    "Tailor",
    "Potter"
  ],
  "friends": [
    "Cogwitz Chillwidget",
    "Tinadette Chillbuster"
  ]
},
*/

//
//  HomeScreenCollections.swift
//  WFFApp
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//

import Foundation
struct HomeScreenCollections :Codable{
    let name:String?
    let collection:String?
    let imageUrl:URL?
    let subcollection:[HomeScreenSubCollection]?
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case collection = "collection"
        case imageUrl = "imageurl"
        case subcollection = "subcollection"
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        collection = try values.decodeIfPresent(String.self, forKey: .collection)
        imageUrl = try values.decodeIfPresent(URL.self, forKey: .imageUrl)
        subcollection = try values.decodeIfPresent([HomeScreenSubCollection].self, forKey: .subcollection)
    }
}
struct HomeScreenSubCollection:Codable{
    let name:String?
    let collection:String?
    let imageUrl:URL?
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case collection = "collection"
        case imageUrl = "imageurl"
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        collection = try values.decodeIfPresent(String.self, forKey: .collection)
        imageUrl = try values.decodeIfPresent(URL.self, forKey: .imageUrl)
    }
}

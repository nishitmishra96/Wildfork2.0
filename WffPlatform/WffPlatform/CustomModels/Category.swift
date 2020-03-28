//
//  Category.swift
//  WffPlatform
//
//  Created by Himanshu Singh on 09/03/20.
//  Copyright © 2020 Himanshu Singh. All rights reserved.
//
/*[{
  "name":"pork",
  "subcategories":["a","b"]
},
{
  "name":"chicken",
  "subcategories":["x","y"]
}
]*/
import Foundation

public struct ProductCategories : Codable {
    public let displayName:String?
    public let name : String?
    public let subcategories : [SubCategories]?
    public let imageurl : String?
    public let handle : String?


    enum CodingKeys: String, CodingKey {
        case name = "name"
        case subcategories = "subcategories"
        case displayName = "displayName"
        case handle = "handle"
        case imageurl = "imageurl"
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        subcategories = try values.decodeIfPresent([SubCategories].self, forKey: .subcategories)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        handle = try values.decodeIfPresent(String.self, forKey: .handle)
        imageurl = try values.decodeIfPresent(String.self, forKey: .imageurl)
    }
}

public struct SubCategories : Codable {
    public let name : String?
    public let handle : String?


    enum CodingKeys: String, CodingKey {
        case name = "name"
        case handle = "handle"
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        handle = try values.decodeIfPresent(String.self, forKey: .handle)
    }
}

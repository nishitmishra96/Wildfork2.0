//
//	Option.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Option : NSObject, NSCoding, Mappable{

	var id : Int?
	var name : String?
	var position : Int?
	var productId : Int?
	var values : [String]?


	 override init() {
           super.init()
       }
       
       required public init?(map: Map) {
           
       }
       
       public func mapping(map: Map)
       {
		id <- map["id"]
		name <- map["name"]
		position <- map["position"]
		productId <- map["product_id"]
		values <- map["values"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         position = aDecoder.decodeObject(forKey: "position") as? Int
         productId = aDecoder.decodeObject(forKey: "product_id") as? Int
         values = aDecoder.decodeObject(forKey: "values") as? [String]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if position != nil{
			aCoder.encode(position, forKey: "position")
		}
		if productId != nil{
			aCoder.encode(productId, forKey: "product_id")
		}
		if values != nil{
			aCoder.encode(values, forKey: "values")
		}

	}

}

//
//	ProductListResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ProductListResponse : NSObject, NSCoding, Mappable{

	var products : [ResponseProduct]?


	 override init() {
           super.init()
       }
       
       required public init?(map: Map) {
           
       }
       
       public func mapping(map: Map)
       {
		products <- map["products"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         products = aDecoder.decodeObject(forKey: "products") as? [ResponseProduct]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if products != nil{
			aCoder.encode(products, forKey: "products")
		}

	}

}

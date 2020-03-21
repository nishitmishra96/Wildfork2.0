//
//	Image.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


public class Image : NSObject, NSCoding, Mappable{

	var adminGraphqlApiId : String?
	public var alt : String?
	var createdAt : String?
	var height : Int?
	var id : Int?
	var position : Int?
	var productId : Int?
	public var src : String?
	var updatedAt : String?
	var variantIds : [AnyObject]?
	var width : Int?


	 override init() {
           super.init()
       }
       
       required public init?(map: Map) {
           
       }
       
       public func mapping(map: Map)
       {
		adminGraphqlApiId <- map["admin_graphql_api_id"]
		alt <- map["alt"]
		createdAt <- map["created_at"]
		height <- map["height"]
		id <- map["id"]
		position <- map["position"]
		productId <- map["product_id"]
		src <- map["src"]
		updatedAt <- map["updated_at"]
		variantIds <- map["variant_ids"]
		width <- map["width"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required public init(coder aDecoder: NSCoder)
	{
         adminGraphqlApiId = aDecoder.decodeObject(forKey: "admin_graphql_api_id") as? String
         alt = aDecoder.decodeObject(forKey: "alt") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         height = aDecoder.decodeObject(forKey: "height") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         position = aDecoder.decodeObject(forKey: "position") as? Int
         productId = aDecoder.decodeObject(forKey: "product_id") as? Int
         src = aDecoder.decodeObject(forKey: "src") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         variantIds = aDecoder.decodeObject(forKey: "variant_ids") as? [AnyObject]
         width = aDecoder.decodeObject(forKey: "width") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc public func encode(with aCoder: NSCoder)
	{
		if adminGraphqlApiId != nil{
			aCoder.encode(adminGraphqlApiId, forKey: "admin_graphql_api_id")
		}
		if alt != nil{
			aCoder.encode(alt, forKey: "alt")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if height != nil{
			aCoder.encode(height, forKey: "height")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if position != nil{
			aCoder.encode(position, forKey: "position")
		}
		if productId != nil{
			aCoder.encode(productId, forKey: "product_id")
		}
		if src != nil{
			aCoder.encode(src, forKey: "src")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if variantIds != nil{
			aCoder.encode(variantIds, forKey: "variant_ids")
		}
		if width != nil{
			aCoder.encode(width, forKey: "width")
		}

	}

}

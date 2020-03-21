//
//	Product.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


public class ResponseProduct : NSObject, NSCoding, Mappable{

	var adminGraphqlApiId : String?
	var bodyHtml : String?
	var createdAt : String?
	var handle : String?
	var id : Int?
	var image : Image?
	public var images : [Image]?
	var options : [Option]?
	var productType : String?
	var publishedAt : String?
	var publishedScope : String?
	var tags : String?
	var templateSuffix : AnyObject?
	var title : String?
	var updatedAt : String?
	var variants : [ResponseVariant]?
	var vendor : String?

    override init() {
           super.init()
       }
       
       required public init?(map: Map) {
           
       }
       
       public func mapping(map: Map)
       {
		adminGraphqlApiId <- map["admin_graphql_api_id"]
		bodyHtml <- map["body_html"]
		createdAt <- map["created_at"]
		handle <- map["handle"]
		id <- map["id"]
		image <- map["image"]
		images <- map["images"]
		options <- map["options"]
		productType <- map["product_type"]
		publishedAt <- map["published_at"]
		publishedScope <- map["published_scope"]
		tags <- map["tags"]
		templateSuffix <- map["template_suffix"]
		title <- map["title"]
		updatedAt <- map["updated_at"]
		variants <- map["variants"]
		vendor <- map["vendor"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required public init(coder aDecoder: NSCoder)
	{
         adminGraphqlApiId = aDecoder.decodeObject(forKey: "admin_graphql_api_id") as? String
         bodyHtml = aDecoder.decodeObject(forKey: "body_html") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         handle = aDecoder.decodeObject(forKey: "handle") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? Image
         images = aDecoder.decodeObject(forKey: "images") as? [Image]
         options = aDecoder.decodeObject(forKey: "options") as? [Option]
         productType = aDecoder.decodeObject(forKey: "product_type") as? String
         publishedAt = aDecoder.decodeObject(forKey: "published_at") as? String
         publishedScope = aDecoder.decodeObject(forKey: "published_scope") as? String
         tags = aDecoder.decodeObject(forKey: "tags") as? String
         templateSuffix = aDecoder.decodeObject(forKey: "template_suffix") as? AnyObject
         title = aDecoder.decodeObject(forKey: "title") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         variants = aDecoder.decodeObject(forKey: "variants") as? [ResponseVariant]
         vendor = aDecoder.decodeObject(forKey: "vendor") as? String

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
		if bodyHtml != nil{
			aCoder.encode(bodyHtml, forKey: "body_html")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if handle != nil{
			aCoder.encode(handle, forKey: "handle")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if options != nil{
			aCoder.encode(options, forKey: "options")
		}
		if productType != nil{
			aCoder.encode(productType, forKey: "product_type")
		}
		if publishedAt != nil{
			aCoder.encode(publishedAt, forKey: "published_at")
		}
		if publishedScope != nil{
			aCoder.encode(publishedScope, forKey: "published_scope")
		}
		if tags != nil{
			aCoder.encode(tags, forKey: "tags")
		}
		if templateSuffix != nil{
			aCoder.encode(templateSuffix, forKey: "template_suffix")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if variants != nil{
			aCoder.encode(variants, forKey: "variants")
		}
		if vendor != nil{
			aCoder.encode(vendor, forKey: "vendor")
		}

	}

}
extension ResponseProduct{
    func getRatings(){
        let reviewId = self.variants?.first?.id ?? 0
        YotpoRestManager.shared.getYotpoReviewFor(productId: "\(reviewId)" ) { (reviews, statusCode) in
            
        }
    }
}

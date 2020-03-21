//
//	Variant.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ResponseVariant : NSObject, NSCoding, Mappable{

	var adminGraphqlApiId : String?
	var barcode : String?
	var compareAtPrice : AnyObject?
	var createdAt : String?
	var fulfillmentService : String?
	var grams : Int?
	var id : Int?
	var imageId : AnyObject?
	var inventoryItemId : Int?
	var inventoryManagement : AnyObject?
	var inventoryPolicy : String?
	var inventoryQuantity : Int?
	var oldInventoryQuantity : Int?
	var option1 : String?
	var option2 : AnyObject?
	var option3 : AnyObject?
	var position : Int?
	var price : String?
	var productId : Int?
	var requiresShipping : Bool?
	var sku : String?
	var taxCode : String?
	var taxable : Bool?
	var title : String?
	var updatedAt : String?
	var weight : Float?
	var weightUnit : String?

    override init() {
           super.init()
       }
       
       required public init?(map: Map) {
           
       }
       
       public func mapping(map: Map)
       {
		adminGraphqlApiId <- map["admin_graphql_api_id"]
		barcode <- map["barcode"]
		compareAtPrice <- map["compare_at_price"]
		createdAt <- map["created_at"]
		fulfillmentService <- map["fulfillment_service"]
		grams <- map["grams"]
		id <- map["id"]
		imageId <- map["image_id"]
		inventoryItemId <- map["inventory_item_id"]
		inventoryManagement <- map["inventory_management"]
		inventoryPolicy <- map["inventory_policy"]
		inventoryQuantity <- map["inventory_quantity"]
		oldInventoryQuantity <- map["old_inventory_quantity"]
		option1 <- map["option1"]
		option2 <- map["option2"]
		option3 <- map["option3"]
		position <- map["position"]
		price <- map["price"]
		productId <- map["product_id"]
		requiresShipping <- map["requires_shipping"]
		sku <- map["sku"]
		taxCode <- map["tax_code"]
		taxable <- map["taxable"]
		title <- map["title"]
		updatedAt <- map["updated_at"]
		weight <- map["weight"]
		weightUnit <- map["weight_unit"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         adminGraphqlApiId = aDecoder.decodeObject(forKey: "admin_graphql_api_id") as? String
         barcode = aDecoder.decodeObject(forKey: "barcode") as? String
         compareAtPrice = aDecoder.decodeObject(forKey: "compare_at_price") as? AnyObject
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         fulfillmentService = aDecoder.decodeObject(forKey: "fulfillment_service") as? String
         grams = aDecoder.decodeObject(forKey: "grams") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imageId = aDecoder.decodeObject(forKey: "image_id") as? AnyObject
         inventoryItemId = aDecoder.decodeObject(forKey: "inventory_item_id") as? Int
         inventoryManagement = aDecoder.decodeObject(forKey: "inventory_management") as? AnyObject
         inventoryPolicy = aDecoder.decodeObject(forKey: "inventory_policy") as? String
         inventoryQuantity = aDecoder.decodeObject(forKey: "inventory_quantity") as? Int
         oldInventoryQuantity = aDecoder.decodeObject(forKey: "old_inventory_quantity") as? Int
         option1 = aDecoder.decodeObject(forKey: "option1") as? String
         option2 = aDecoder.decodeObject(forKey: "option2") as? AnyObject
         option3 = aDecoder.decodeObject(forKey: "option3") as? AnyObject
         position = aDecoder.decodeObject(forKey: "position") as? Int
         price = aDecoder.decodeObject(forKey: "price") as? String
         productId = aDecoder.decodeObject(forKey: "product_id") as? Int
         requiresShipping = aDecoder.decodeObject(forKey: "requires_shipping") as? Bool
         sku = aDecoder.decodeObject(forKey: "sku") as? String
         taxCode = aDecoder.decodeObject(forKey: "tax_code") as? String
         taxable = aDecoder.decodeObject(forKey: "taxable") as? Bool
         title = aDecoder.decodeObject(forKey: "title") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         weight = aDecoder.decodeObject(forKey: "weight") as? Float
         weightUnit = aDecoder.decodeObject(forKey: "weight_unit") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if adminGraphqlApiId != nil{
			aCoder.encode(adminGraphqlApiId, forKey: "admin_graphql_api_id")
		}
		if barcode != nil{
			aCoder.encode(barcode, forKey: "barcode")
		}
		if compareAtPrice != nil{
			aCoder.encode(compareAtPrice, forKey: "compare_at_price")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if fulfillmentService != nil{
			aCoder.encode(fulfillmentService, forKey: "fulfillment_service")
		}
		if grams != nil{
			aCoder.encode(grams, forKey: "grams")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if imageId != nil{
			aCoder.encode(imageId, forKey: "image_id")
		}
		if inventoryItemId != nil{
			aCoder.encode(inventoryItemId, forKey: "inventory_item_id")
		}
		if inventoryManagement != nil{
			aCoder.encode(inventoryManagement, forKey: "inventory_management")
		}
		if inventoryPolicy != nil{
			aCoder.encode(inventoryPolicy, forKey: "inventory_policy")
		}
		if inventoryQuantity != nil{
			aCoder.encode(inventoryQuantity, forKey: "inventory_quantity")
		}
		if oldInventoryQuantity != nil{
			aCoder.encode(oldInventoryQuantity, forKey: "old_inventory_quantity")
		}
		if option1 != nil{
			aCoder.encode(option1, forKey: "option1")
		}
		if option2 != nil{
			aCoder.encode(option2, forKey: "option2")
		}
		if option3 != nil{
			aCoder.encode(option3, forKey: "option3")
		}
		if position != nil{
			aCoder.encode(position, forKey: "position")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if productId != nil{
			aCoder.encode(productId, forKey: "product_id")
		}
		if requiresShipping != nil{
			aCoder.encode(requiresShipping, forKey: "requires_shipping")
		}
		if sku != nil{
			aCoder.encode(sku, forKey: "sku")
		}
		if taxCode != nil{
			aCoder.encode(taxCode, forKey: "tax_code")
		}
		if taxable != nil{
			aCoder.encode(taxable, forKey: "taxable")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if weight != nil{
			aCoder.encode(weight, forKey: "weight")
		}
		if weightUnit != nil{
			aCoder.encode(weightUnit, forKey: "weight_unit")
		}

	}

}

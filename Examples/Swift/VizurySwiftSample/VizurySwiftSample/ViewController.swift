//
//  ViewController.swift
//  VizurySwiftSample
//
//  Created by Chowdhury Md Rajib  Sarwar on 27/4/20.
//  Copyright © 2020 Chowdhury Md Rajib  Sarwar. All rights reserved.
//

import UIKit
import VizuryEventLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func normalEvent(_ sender: Any) {
        let attributeDictionary = NSDictionary(dictionary: ["productid" : "AKSJDASNBD",
                                                            "productPrice": "789",
                                                            "category": "Shirt"])
        VizuryEventLogger.logEvent("productPage", withAttributes: attributeDictionary as? [AnyHashable : Any])
    }
    
    @IBAction func jsonEvent(_ sender: Any) {
        let productDetail = NSDictionary(dictionary: ["product_id" : "62112",
                                                      "quantity": "1",
                                                      "price": "50"])
        
        var productjsonData = Data()
        do {
        productjsonData = try JSONSerialization.data(withJSONObject: productDetail, options: [])
        } catch {
            print(error)
        }
        
        let productjsonStr = String(data: productjsonData, encoding: .utf8)
        let productjsonDictionary = NSDictionary(dictionary: ["viz_data" : productjsonStr!])
        
        VizuryEventLogger.logEvent("productDetails", withAttributes: productjsonDictionary as? [AnyHashable : Any])
        
        var products = [NSDictionary]()
        let productDetail1 = NSDictionary(dictionary: ["product_id" : "62112",
                                                      "quantity": "1",
                                                      "price": "50"])
        
        let productDetail2 = NSDictionary(dictionary: ["product_id" : "123123",
                                                       "quantity": "1",
                                                       "price": "50"])
        products.append(productDetail1)
        products.append(productDetail2)

        var wishListjsonData = Data()
        do {
        wishListjsonData = try JSONSerialization.data(withJSONObject: products, options: [])
        } catch {
            print(error)
        }
        let wishListjsonStr = String(data: wishListjsonData, encoding: .utf8)
        
        let wishListjsonDictionary = NSDictionary(dictionary: ["viz_data" : wishListjsonStr!])
        VizuryEventLogger.logEvent("wishlist", withAttributes: wishListjsonDictionary as? [AnyHashable : Any])
    }
}


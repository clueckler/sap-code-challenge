//
// Constants.swift
// Offline
//
//  Copyright © 2016. SAP. All rights reserved.
//

import Foundation

enum CollectionType: String {
    case myPrefixSalesOrderHeaders = "SalesOrderHeaders"
    case myPrefixProductTexts = "ProductTexts"
    case myPrefixSuppliers = "Suppliers"
    case myPrefixPurchaseOrderItems = "PurchaseOrderItems"
    case myPrefixStock = "Stock"
    case myPrefixCustomers = "Customers"
    case myPrefixProductCategories = "ProductCategories"
    case myPrefixSalesOrderItems = "SalesOrderItems"
    case myPrefixPurchaseOrderHeaders = "PurchaseOrderHeaders"
    case myPrefixProducts = "Products"
    case none = ""

    static let allValues: [CollectionType] = [
        myPrefixSalesOrderHeaders, myPrefixProductTexts, myPrefixSuppliers, myPrefixPurchaseOrderItems, myPrefixStock, myPrefixCustomers, myPrefixProductCategories, myPrefixSalesOrderItems, myPrefixPurchaseOrderHeaders, myPrefixProducts
    ]
}

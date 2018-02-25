//
//  DomainModel.swift
//  Offline
//
//  Created by Josep Rodriguez on 25/02/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit

class Task {
    let taskID: String
    let lifeCycleStatusName: String
    let salesOrder: MyPrefixSalesOrderHeader

    init(mapping: MyPrefixSalesOrderHeader) {
        taskID = mapping.salesOrderID ?? "UNKNOWN"
        lifeCycleStatusName = mapping.lifeCycleStatusName ?? "New"
        salesOrder = mapping
    }
}

class Part {
    let partID: String
    let name: String
    let categoryName: String
    let price: String
    let currencyCode: String
    let longDescription: String
    let supplierID: String
    let dimensionUnit: String
    let depth: String
    let width: String
    let height: String
    
    init(mapping: MyPrefixProduct) {
        partID = mapping.productID ?? "NA"
        name = mapping.name ?? "No name"
        categoryName = mapping.categoryName ?? "No category"
        price = mapping.price?.toString() ?? "NA"
        currencyCode = mapping.currencyCode ?? "EUR"
        supplierID = mapping.supplierID ?? "NA"
        longDescription = mapping.longDescription ?? ""
        dimensionUnit = mapping.dimensionUnit ?? ""
        height = mapping.dimensionHeight?.toString() ?? "0"
        width = mapping.dimensionWidth?.toString() ?? "0"
        depth = mapping.dimensionDepth?.toString() ?? "0"
    }
}

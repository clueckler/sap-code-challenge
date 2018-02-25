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

    init(mapping: MyPrefixProduct) {
        partID = mapping.productID ?? "NA"
        name = mapping.name ?? "No name"
        categoryName = mapping.categoryName ?? "No category"
    }
}

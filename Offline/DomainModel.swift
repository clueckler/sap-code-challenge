//
//  DomainModel.swift
//  Offline
//
//  Created by Josep Rodriguez on 25/02/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import CoreLocation

var locationCache: [String: CLLocationCoordinate2D] = [:]

extension CLLocationCoordinate2D {
    func translate(byLatitude latitudeDelta: Double, byLongitude longitudeDelta: Double) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude + latitudeDelta , longitude: self.longitude + longitudeDelta)
    }
}

let firaBarcelonaGranVia = CLLocationCoordinate2D(latitude: 41.3544734, longitude: 2.1256795)
private func randomizeLocation() -> CLLocationCoordinate2D {
    
    let latitudeDelta = Double(arc4random_uniform(4001)) * 0.00001
    let longitudeDelta = Double(arc4random_uniform(5001)) * 0.00001
    return firaBarcelonaGranVia.translate(byLatitude: latitudeDelta, byLongitude: longitudeDelta)
}

private func location(for taskID: String) -> CLLocationCoordinate2D {
    guard let location = locationCache[taskID] else {
        let location = randomizeLocation()
        locationCache[taskID] = location
        return location
    }
    return location
}

class Task {
    let source: MyPrefixSalesOrderHeader

    let taskID: String
    let lifeCycleStatusName: String
    let salesOrder: MyPrefixSalesOrderHeader
    let coordinates: CLLocationCoordinate2D

    init(mapping: MyPrefixSalesOrderHeader) {
        source = mapping
        taskID = mapping.salesOrderID ?? "UNKNOWN"
        lifeCycleStatusName = mapping.lifeCycleStatusName ?? "New"
        salesOrder = mapping
        coordinates = location(for: taskID)
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

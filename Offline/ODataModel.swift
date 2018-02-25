//
//  ODataModel.swift
//
//  Copyright © 2016 Lechner, Sami. All rights reserved.
//

import Foundation
import SAPFoundation
import SAPOData
import SAPOfflineOData
import SAPCommon

class ODataModel {
    private let espmOdataService: MyServiceClass<OnlineODataProvider>
    // creating the Offline Odata Provider
    private var offlineService: MyServiceClass<OfflineODataProvider>
    private(set) var isOfflineStoreOpened = false // variable is internal (app) read and private write

    init(urlSession: SAPURLSession) {
        let odataProvider = OnlineODataProvider(serviceName: "myServiceName", serviceRoot: Authenticator.Constants.appURL)
        odataProvider.sapURLSession = urlSession
        Logger.root.logLevel = LogLevel.debug
        espmOdataService = MyServiceClass(provider: odataProvider)
        // To update entity force to use X-HTTP-Method header
        _ = espmOdataService.networkOptions.tunneledMethods.append("MERGE")
        espmOdataService.traceRequests = true
        espmOdataService.prettyTracing = true
        espmOdataService.traceWithData = true

        /// defining Request for offline
        /// initialise the OfflineODataParameters which
        var offlineParameters = OfflineODataParameters()
        offlineParameters.customHeaders = ["X-SMP-APPID": Authenticator.Constants.appID]
        let offlineODataProvider = try! OfflineODataProvider(serviceRoot: URL(string: Authenticator.Constants.appURL.absoluteString)!, parameters: offlineParameters, sapURLSession: urlSession)
        /// define the initial set of Data, the AppID and the Offline OData Provider for the store
        try! offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: CollectionType.myPrefixSalesOrderHeaders.rawValue, query: "/\(CollectionType.myPrefixSalesOrderHeaders.rawValue)", automaticallyRetrievesStreams: false))
        try! offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: CollectionType.myPrefixSalesOrderItems.rawValue, query: "/\(CollectionType.myPrefixSalesOrderItems.rawValue)", automaticallyRetrievesStreams: false))
        try! offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name:
            CollectionType.myPrefixProducts.rawValue, query: "/\(CollectionType.myPrefixProducts.rawValue)", automaticallyRetrievesStreams: false))
        offlineService = MyServiceClass(provider: offlineODataProvider)
    }

    /// opens the offline store. if store does not exists it will trigger the initial download of the store and create the local DB
    ///
    /// - Returns: returns the status
    func openOfflineStore(completionHandler: @escaping (String) -> Void) {
        guard !isOfflineStoreOpened else {
            completionHandler("Offline store opened.")
            return
        }
        /// The OfflineODataProvider needs to be opened before performing any operations.

        offlineService.open { error in
            if let error = error {
                completionHandler("Could not open offline store. \(error.localizedDescription)")
                return
            }
            self.isOfflineStoreOpened = true
            completionHandler("Offline store opened.")
        }
    }

    /// closes the offline store
    ///
    /// - Returns: returns the status
    func closeOfflineStore() -> String {
        if isOfflineStoreOpened {
            do {
                /// the Offline store should be closed when it is no longer used.
                try offlineService.close()
                isOfflineStoreOpened = false
            } catch {
                return String("Offline Store closing failed")
            }
        }
        return String("Offline Store closed")
    }

    /// downloads all deltas from the server to update the local store
    ///
    /// - Returns: returns the status
    func downloadOfflineStore(completionHandler: @escaping (String) -> Void) {
        if !isOfflineStoreOpened {
            completionHandler("Offline Store still closed")
            return
        }
        /// the download function update the client’s offline store from the backend.
        offlineService.download { error in
            if let error = error {
                completionHandler("Offline Store download failed \(error.localizedDescription)")
                return
            }
            completionHandler("Offline Store is downloaded")
        }
    }

    /// uploads all local changes to the server
    ///
    /// - Returns: returns the status
    func uploadOfflineStore(completionHandler: @escaping (String) -> Void) {
        if !isOfflineStoreOpened {
            completionHandler("Offline Store still closed")
            return
        }
        /// the update function update the client’s backend through SAP HCPms
        offlineService.upload { error in
            if let error = error {
                completionHandler("Offline Store upload failed \(error.localizedDescription)")
                return
            }
            completionHandler("Offline Store has uploaded")
        }
    }

    /// loads all sales orders and their items
    ///
    /// - Returns: list of sales orders
    /// - Throws: error
    func loadSalesOrders(completionHandler: @escaping (_ result: [MyPrefixSalesOrderHeader]?, _ error: String?) -> Void) {

        let query = DataQuery().orderBy(MyPrefixSalesOrderHeader.salesOrderID).expand(MyPrefixSalesOrderHeader.items).expand(MyPrefixSalesOrderHeader.customerDetails)
        if isOfflineStoreOpened {
            /// the same query as it was set up for the online use can be fired against the initialised the offline Odata Service
            offlineService.fetchSalesOrderHeaders(matching: query) { salesOrders, error in
                if let error = error {
                    completionHandler(nil, "Loading Sales Orders failed \(error.localizedDescription)")
                    return
                }
                completionHandler(salesOrders!, nil)
            }
        } else {
            espmOdataService.fetchSalesOrderHeaders(matching: query) { salesOrders, error in
                if let error = error {
                    completionHandler(nil, "Loading Sales Orders failed \(error.localizedDescription)")
                    return
                }
                completionHandler(salesOrders!, nil)
            }
        }
    }

    /// loads all sales orders and their items
    ///
    /// - Returns: list of sales orders
    /// - Throws: error
    func loadSalesOpenOrders(completionHandler: @escaping (_ result: [MyPrefixSalesOrderHeader]?, _ error: String?) -> Void) {
        
        let query = DataQuery().orderBy(MyPrefixSalesOrderHeader.salesOrderID).expand(MyPrefixSalesOrderHeader.items).expand(MyPrefixSalesOrderHeader.customerDetails).filter(MyPrefixSalesOrderHeader.lifeCycleStatus.equal("N"))
        if isOfflineStoreOpened {
            /// the same query as it was set up for the online use can be fired against the initialised the offline Odata Service
            offlineService.fetchSalesOrderHeaders(matching: query) { salesOrders, error in
                if let error = error {
                    completionHandler(nil, "Loading Sales Orders failed \(error.localizedDescription)")
                    return
                }
                completionHandler(salesOrders!, nil)
            }
        } else {
            espmOdataService.fetchSalesOrderHeaders(matching: query) { salesOrders, error in
                if let error = error {
                    completionHandler(nil, "Loading Sales Orders failed \(error.localizedDescription)")
                    return
                }
                completionHandler(salesOrders!, nil)
            }
        }
    }
    /// loads all sales orders and their items
    ///
    /// - Returns: list of sales orders
    /// - Throws: error
    func loadProdcuts(completionHandler: @escaping (_ result: [MyPrefixProduct]?, _ error: String?) -> Void) {
        
        let query = DataQuery().orderBy(MyPrefixProduct.productID)
        if isOfflineStoreOpened {
            /// the same query as it was set up for the online use can be fired against the initialised the offline Odata Service
            offlineService.fetchProducts(matching: query) { products, error in
                if let error = error {
                    completionHandler(nil, "Loading Products failed \(error.localizedDescription)")
                    return
                }
                completionHandler(products!, nil)
            }
        } else {
            espmOdataService.fetchProducts(matching: query) { products, error in
                if let error = error {
                    completionHandler(nil, "Loading Products failed \(error.localizedDescription)")
                    return
                }
                completionHandler(products!, nil)
            }
        }
    }
    
    /// loads products in one SalesOrder
    ///
    /// - Returns: list of products
    /// - Throws: error
    func loadProdcutsForSalesOrder(salesOrder : MyPrefixSalesOrderHeader ,completionHandler: @escaping (_ result: [MyPrefixProduct]?, _ error: String?) -> Void) {
        
        let query = DataQuery().filter(MyPrefixSalesOrderHeader.salesOrderID.equal(salesOrder.salesOrderID!)).expand(MyPrefixSalesOrderHeader.items)
        
        if isOfflineStoreOpened {
            /// the same query as it was set up for the online use can be fired against the initialised the offline Odata Service
            offlineService.fetchSalesOrderHeaders(matching: query) { salesOrders, error in
                var products: [MyPrefixProduct] = []
                
                if let error = error {
                    completionHandler(nil, "Loading Products failed \(error.localizedDescription)")
                    return
                }
                for sOrder in salesOrders! {
                    for sOrderItem in sOrder.items {
                        let group = DispatchGroup()
                        let queryProduct = DataQuery().filter(MyPrefixProduct.productID.equal(sOrderItem.productID!))
                        
                        group.enter()
                        
                        DispatchQueue.global().async {
                            if let productsResults = try? self.espmOdataService.fetchProducts(matching: queryProduct) {
                                for productResultSet in productsResults {
                                    products.append( productResultSet)
                                    
                                }
                            }
                            group.leave()
                        }
                        
                        group.wait()
                    }
                }
                completionHandler(products, nil)
            }
        } else {
            espmOdataService.fetchSalesOrderHeaders(matching: query) { salesOrders, error in
                var products: [MyPrefixProduct] = []

                if let error = error {
                    completionHandler(nil, "Loading Products failed \(error.localizedDescription)")
                    return
                }
                for sOrder in salesOrders! {
                    for sOrderItem in sOrder.items {
                        let group = DispatchGroup()
                        let queryProduct = DataQuery().filter(MyPrefixProduct.productID.equal(sOrderItem.productID!))
                        
                        group.enter()
                        
                        DispatchQueue.global().async {
                            if let productsResults = try? self.espmOdataService.fetchProducts(matching: queryProduct) {
                                for productResultSet in productsResults {
                                    products.append( productResultSet)
                                    
                                }
                            }
                            group.leave()
                        }
 
                        group.wait()
                    }
                }
                completionHandler(products, nil)
            }
        }
    }
    
    /// updates a single sales order item
    ///
    /// - Parameters:
    ///   - currentQuantity: int of the new quantity
    ///   - currentSalesOrderItem: current sales order which is supposed to updated
    /// - Throws: error
    func updateSalesOrderitem(currentQuantity: Int, currentSalesOrderItem: MyPrefixSalesOrderItem) throws {
        currentSalesOrderItem.quantity = BigDecimal(currentQuantity)

        do {

            if isOfflineStoreOpened {
                try offlineService.updateEntity(currentSalesOrderItem)
            } else {
                try espmOdataService.updateEntity(currentSalesOrderItem)
            }
        } catch {
            // handle error here
            throw error
        }
    }
    /// updates a single sales order item
    ///
    /// - Parameters:
    ///   - currentQuantity: int of the new quantity
    ///   - currentSalesOrderItem: current sales order which is supposed to updated
    /// - Throws: error
    func updateSalesOrderHeader(status: String, currentSalesOrder: MyPrefixSalesOrderHeader) throws {
        let indexEndOfText = status.index(status.startIndex, offsetBy: 1)
        let substring = status[status.startIndex..<indexEndOfText]

        currentSalesOrder.lifeCycleStatus = substring.uppercased()
        currentSalesOrder.lifeCycleStatusName = status
        do {
            try espmOdataService.updateEntity(currentSalesOrder)
        } catch {
            // handle error here
            throw error
        }
    }
    /// updates a single sales order item
    ///
    /// - Parameters:
    ///   - currentQuantity: int of the new quantity
    ///   - currentSalesOrderItem: current sales order which is supposed to updated
    /// - Throws: error
    func updateProduct( currentProduct: MyPrefixProduct) throws {
        do {
            try espmOdataService.updateEntity(currentProduct)
        } catch {
            // handle error here
            throw error
        }
    }
}

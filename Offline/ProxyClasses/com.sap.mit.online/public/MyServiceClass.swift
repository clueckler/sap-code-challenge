//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

open class MyServiceClass<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = MyServiceClassMetadata.document
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomers")
    open func customers(query: DataQuery = DataQuery()) throws -> Array<MyPrefixCustomer> {
        return try self.fetchCustomers(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomers")
    open func customers(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixCustomer>?, Error?) -> Void) -> Void {
        self.fetchCustomers(matching: query, completionHandler: completionHandler)
    }

    open func fetchCustomer(matching query: DataQuery) throws -> MyPrefixCustomer {
        return try CastRequired<MyPrefixCustomer>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.customers)).requiredEntity())
    }

    open func fetchCustomer(matching query: DataQuery, completionHandler: @escaping (MyPrefixCustomer?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixCustomer = try self.fetchCustomer(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchCustomers(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixCustomer> {
        return try MyPrefixCustomer.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.customers)).entityList())
    }

    open func fetchCustomers(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixCustomer>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixCustomer> = try self.fetchCustomers(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchProduct(matching query: DataQuery) throws -> MyPrefixProduct {
        return try CastRequired<MyPrefixProduct>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.products)).requiredEntity())
    }

    open func fetchProduct(matching query: DataQuery, completionHandler: @escaping (MyPrefixProduct?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixProduct = try self.fetchProduct(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchProductCategories(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixProductCategory> {
        return try MyPrefixProductCategory.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.productCategories)).entityList())
    }

    open func fetchProductCategories(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixProductCategory>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixProductCategory> = try self.fetchProductCategories(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchProductCategory(matching query: DataQuery) throws -> MyPrefixProductCategory {
        return try CastRequired<MyPrefixProductCategory>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.productCategories)).requiredEntity())
    }

    open func fetchProductCategory(matching query: DataQuery, completionHandler: @escaping (MyPrefixProductCategory?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixProductCategory = try self.fetchProductCategory(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchProductText(matching query: DataQuery) throws -> MyPrefixProductText {
        return try CastRequired<MyPrefixProductText>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.productTexts)).requiredEntity())
    }

    open func fetchProductText(matching query: DataQuery, completionHandler: @escaping (MyPrefixProductText?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixProductText = try self.fetchProductText(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchProductTexts(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixProductText> {
        return try MyPrefixProductText.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.productTexts)).entityList())
    }

    open func fetchProductTexts(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixProductText>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixProductText> = try self.fetchProductTexts(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchProducts(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixProduct> {
        return try MyPrefixProduct.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.products)).entityList())
    }

    open func fetchProducts(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixProduct>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixProduct> = try self.fetchProducts(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchPurchaseOrderHeader(matching query: DataQuery) throws -> MyPrefixPurchaseOrderHeader {
        return try CastRequired<MyPrefixPurchaseOrderHeader>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.purchaseOrderHeaders)).requiredEntity())
    }

    open func fetchPurchaseOrderHeader(matching query: DataQuery, completionHandler: @escaping (MyPrefixPurchaseOrderHeader?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixPurchaseOrderHeader = try self.fetchPurchaseOrderHeader(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchPurchaseOrderHeaders(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixPurchaseOrderHeader> {
        return try MyPrefixPurchaseOrderHeader.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.purchaseOrderHeaders)).entityList())
    }

    open func fetchPurchaseOrderHeaders(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixPurchaseOrderHeader>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixPurchaseOrderHeader> = try self.fetchPurchaseOrderHeaders(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery) throws -> MyPrefixPurchaseOrderItem {
        return try CastRequired<MyPrefixPurchaseOrderItem>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.purchaseOrderItems)).requiredEntity())
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery, completionHandler: @escaping (MyPrefixPurchaseOrderItem?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixPurchaseOrderItem = try self.fetchPurchaseOrderItem(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixPurchaseOrderItem> {
        return try MyPrefixPurchaseOrderItem.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.purchaseOrderItems)).entityList())
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixPurchaseOrderItem>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixPurchaseOrderItem> = try self.fetchPurchaseOrderItems(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSalesOrderHeader(matching query: DataQuery) throws -> MyPrefixSalesOrderHeader {
        return try CastRequired<MyPrefixSalesOrderHeader>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.salesOrderHeaders)).requiredEntity())
    }

    open func fetchSalesOrderHeader(matching query: DataQuery, completionHandler: @escaping (MyPrefixSalesOrderHeader?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixSalesOrderHeader = try self.fetchSalesOrderHeader(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSalesOrderHeaders(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixSalesOrderHeader> {
        return try MyPrefixSalesOrderHeader.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.salesOrderHeaders)).entityList())
    }

    open func fetchSalesOrderHeaders(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixSalesOrderHeader>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixSalesOrderHeader> = try self.fetchSalesOrderHeaders(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSalesOrderItem(matching query: DataQuery) throws -> MyPrefixSalesOrderItem {
        return try CastRequired<MyPrefixSalesOrderItem>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.salesOrderItems)).requiredEntity())
    }

    open func fetchSalesOrderItem(matching query: DataQuery, completionHandler: @escaping (MyPrefixSalesOrderItem?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixSalesOrderItem = try self.fetchSalesOrderItem(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSalesOrderItems(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixSalesOrderItem> {
        return try MyPrefixSalesOrderItem.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.salesOrderItems)).entityList())
    }

    open func fetchSalesOrderItems(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixSalesOrderItem>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixSalesOrderItem> = try self.fetchSalesOrderItems(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchStock(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixStock> {
        return try MyPrefixStock.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.stock)).entityList())
    }

    open func fetchStock(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixStock>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixStock> = try self.fetchStock(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchStock1(matching query: DataQuery) throws -> MyPrefixStock {
        return try CastRequired<MyPrefixStock>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.stock)).requiredEntity())
    }

    open func fetchStock1(matching query: DataQuery, completionHandler: @escaping (MyPrefixStock?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixStock = try self.fetchStock1(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSupplier(matching query: DataQuery) throws -> MyPrefixSupplier {
        return try CastRequired<MyPrefixSupplier>.from(self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.suppliers)).requiredEntity())
    }

    open func fetchSupplier(matching query: DataQuery, completionHandler: @escaping (MyPrefixSupplier?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: MyPrefixSupplier = try self.fetchSupplier(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSuppliers(matching query: DataQuery = DataQuery()) throws -> Array<MyPrefixSupplier> {
        return try MyPrefixSupplier.array(from: self.executeQuery(query.fromDefault(MyServiceClassMetadata.EntitySets.suppliers)).entityList())
    }

    open func fetchSuppliers(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixSupplier>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Array<MyPrefixSupplier> = try self.fetchSuppliers(matching: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func generateSamplePurcharOrders(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(self.executeQuery(query.invoke(MyServiceClassMetadata.ActionImports.generateSamplePurcharOrders, ParameterList.empty)).result)
    }

    open func generateSamplePurcharOrders(query: DataQuery = DataQuery(), completionHandler: @escaping (Bool?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Bool? = try self.generateSamplePurcharOrders(query: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func generateSampleSalesOrders(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(self.executeQuery(query.invoke(MyServiceClassMetadata.ActionImports.generateSampleSalesOrders, ParameterList.empty)).result)
    }

    open func generateSampleSalesOrders(query: DataQuery = DataQuery(), completionHandler: @escaping (Bool?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Bool? = try self.generateSampleSalesOrders(query: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductCategories")
    open func productCategories(query: DataQuery = DataQuery()) throws -> Array<MyPrefixProductCategory> {
        return try self.fetchProductCategories(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductCategories")
    open func productCategories(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixProductCategory>?, Error?) -> Void) -> Void {
        self.fetchProductCategories(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductTexts")
    open func productTexts(query: DataQuery = DataQuery()) throws -> Array<MyPrefixProductText> {
        return try self.fetchProductTexts(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductTexts")
    open func productTexts(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixProductText>?, Error?) -> Void) -> Void {
        self.fetchProductTexts(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProducts")
    open func products(query: DataQuery = DataQuery()) throws -> Array<MyPrefixProduct> {
        return try self.fetchProducts(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProducts")
    open func products(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixProduct>?, Error?) -> Void) -> Void {
        self.fetchProducts(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderHeaders")
    open func purchaseOrderHeaders(query: DataQuery = DataQuery()) throws -> Array<MyPrefixPurchaseOrderHeader> {
        return try self.fetchPurchaseOrderHeaders(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderHeaders")
    open func purchaseOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixPurchaseOrderHeader>?, Error?) -> Void) -> Void {
        self.fetchPurchaseOrderHeaders(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderItems")
    open func purchaseOrderItems(query: DataQuery = DataQuery()) throws -> Array<MyPrefixPurchaseOrderItem> {
        return try self.fetchPurchaseOrderItems(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderItems")
    open func purchaseOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixPurchaseOrderItem>?, Error?) -> Void) -> Void {
        self.fetchPurchaseOrderItems(matching: query, completionHandler: completionHandler)
    }

    override open func refreshMetadata() throws -> Void {
        objc_sync_enter(self)
        defer { objc_sync_exit(self); }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: MyServiceClassMetadataParser.options)
            MyServiceClassMetadataChanges.merge(metadata: self.metadata)
        }
    }

    open func resetSampleData(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(self.executeQuery(query.invoke(MyServiceClassMetadata.ActionImports.resetSampleData, ParameterList.empty)).result)
    }

    open func resetSampleData(query: DataQuery = DataQuery(), completionHandler: @escaping (Bool?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
        do {
            let result: Bool? = try self.resetSampleData(query: query)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderHeaders")
    open func salesOrderHeaders(query: DataQuery = DataQuery()) throws -> Array<MyPrefixSalesOrderHeader> {
        return try self.fetchSalesOrderHeaders(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderHeaders")
    open func salesOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixSalesOrderHeader>?, Error?) -> Void) -> Void {
        self.fetchSalesOrderHeaders(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderItems")
    open func salesOrderItems(query: DataQuery = DataQuery()) throws -> Array<MyPrefixSalesOrderItem> {
        return try self.fetchSalesOrderItems(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderItems")
    open func salesOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixSalesOrderItem>?, Error?) -> Void) -> Void {
        self.fetchSalesOrderItems(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchStock")
    open func stock(query: DataQuery = DataQuery()) throws -> Array<MyPrefixStock> {
        return try self.fetchStock(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchStock")
    open func stock(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixStock>?, Error?) -> Void) -> Void {
        self.fetchStock(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSuppliers")
    open func suppliers(query: DataQuery = DataQuery()) throws -> Array<MyPrefixSupplier> {
        return try self.fetchSuppliers(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSuppliers")
    open func suppliers(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<MyPrefixSupplier>?, Error?) -> Void) -> Void {
        self.fetchSuppliers(matching: query, completionHandler: completionHandler)
    }
}

//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

internal class MyServiceClassFactory {
    static func registerAll() throws -> Void {
        MyServiceClassMetadata.EntityTypes.customer.registerFactory(ObjectFactory.with(create: { MyPrefixCustomer(withDefaults: false) }, createWithDecoder: { d in try MyPrefixCustomer(from: d) } ))
        MyServiceClassMetadata.EntityTypes.product.registerFactory(ObjectFactory.with(create: { MyPrefixProduct(withDefaults: false) }, createWithDecoder: { d in try MyPrefixProduct(from: d) } ))
        MyServiceClassMetadata.EntityTypes.productCategory.registerFactory(ObjectFactory.with(create: { MyPrefixProductCategory(withDefaults: false) }, createWithDecoder: { d in try MyPrefixProductCategory(from: d) } ))
        MyServiceClassMetadata.EntityTypes.productText.registerFactory(ObjectFactory.with(create: { MyPrefixProductText(withDefaults: false) }, createWithDecoder: { d in try MyPrefixProductText(from: d) } ))
        MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.registerFactory(ObjectFactory.with(create: { MyPrefixPurchaseOrderHeader(withDefaults: false) }, createWithDecoder: { d in try MyPrefixPurchaseOrderHeader(from: d) } ))
        MyServiceClassMetadata.EntityTypes.purchaseOrderItem.registerFactory(ObjectFactory.with(create: { MyPrefixPurchaseOrderItem(withDefaults: false) }, createWithDecoder: { d in try MyPrefixPurchaseOrderItem(from: d) } ))
        MyServiceClassMetadata.EntityTypes.salesOrderHeader.registerFactory(ObjectFactory.with(create: { MyPrefixSalesOrderHeader(withDefaults: false) }, createWithDecoder: { d in try MyPrefixSalesOrderHeader(from: d) } ))
        MyServiceClassMetadata.EntityTypes.salesOrderItem.registerFactory(ObjectFactory.with(create: { MyPrefixSalesOrderItem(withDefaults: false) }, createWithDecoder: { d in try MyPrefixSalesOrderItem(from: d) } ))
        MyServiceClassMetadata.EntityTypes.stock.registerFactory(ObjectFactory.with(create: { MyPrefixStock(withDefaults: false) }, createWithDecoder: { d in try MyPrefixStock(from: d) } ))
        MyServiceClassMetadata.EntityTypes.supplier.registerFactory(ObjectFactory.with(create: { MyPrefixSupplier(withDefaults: false) }, createWithDecoder: { d in try MyPrefixSupplier(from: d) } ))
        MyServiceClassStaticResolver.resolve()
    }
}

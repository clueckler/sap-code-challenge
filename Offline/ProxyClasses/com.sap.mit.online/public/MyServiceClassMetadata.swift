//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

public class MyServiceClassMetadata {
    public static var document: CSDLDocument = MyServiceClassMetadata.resolve()

    private static func resolve() -> CSDLDocument {
        try! MyServiceClassFactory.registerAll()
        MyServiceClassMetadataParser.parsed.hasGeneratedProxies = true
        return MyServiceClassMetadataParser.parsed
    }

    public class EntityTypes {
        public static var customer: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.Customer")

        public static var product: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.Product")

        public static var productCategory: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.ProductCategory")

        public static var productText: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.ProductText")

        public static var purchaseOrderHeader: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.PurchaseOrderHeader")

        public static var purchaseOrderItem: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.PurchaseOrderItem")

        public static var salesOrderHeader: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.SalesOrderHeader")

        public static var salesOrderItem: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.SalesOrderItem")

        public static var stock: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.Stock")

        public static var supplier: EntityType = MyServiceClassMetadataParser.parsed.entityType(withName: "ESPM.Supplier")
    }

    public class EntitySets {
        public static var customers: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "Customers")

        public static var productCategories: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "ProductCategories")

        public static var productTexts: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "ProductTexts")

        public static var products: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "Products")

        public static var purchaseOrderHeaders: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "PurchaseOrderHeaders")

        public static var purchaseOrderItems: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "PurchaseOrderItems")

        public static var salesOrderHeaders: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "SalesOrderHeaders")

        public static var salesOrderItems: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "SalesOrderItems")

        public static var stock: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "Stock")

        public static var suppliers: EntitySet = MyServiceClassMetadataParser.parsed.entitySet(withName: "Suppliers")
    }

    public class ActionImports {
        public static var generateSamplePurcharOrders: DataMethod = MyServiceClassMetadataParser.parsed.dataMethod(withName: "GenerateSamplePurcharOrders")

        public static var generateSampleSalesOrders: DataMethod = MyServiceClassMetadataParser.parsed.dataMethod(withName: "GenerateSampleSalesOrders")

        public static var resetSampleData: DataMethod = MyServiceClassMetadataParser.parsed.dataMethod(withName: "ResetSampleData")
    }
}

//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

internal class MyServiceClassMetadataChanges: ObjectBase {
    override init() {
    }

    class func merge(metadata: CSDLDocument) -> Void {
        metadata.hasGeneratedProxies = true
        MyServiceClassMetadata.document = metadata
        MyServiceClassMetadataChanges.merge1(metadata: metadata)
        try! MyServiceClassFactory.registerAll()
    }

    private class func merge1(metadata: CSDLDocument) -> Void {
        Ignore.valueOf_any(metadata)
        if !MyServiceClassMetadata.EntityTypes.customer.isRemoved {
            MyServiceClassMetadata.EntityTypes.customer = metadata.entityType(withName: "ESPM.Customer")
        }
        if !MyServiceClassMetadata.EntityTypes.product.isRemoved {
            MyServiceClassMetadata.EntityTypes.product = metadata.entityType(withName: "ESPM.Product")
        }
        if !MyServiceClassMetadata.EntityTypes.productCategory.isRemoved {
            MyServiceClassMetadata.EntityTypes.productCategory = metadata.entityType(withName: "ESPM.ProductCategory")
        }
        if !MyServiceClassMetadata.EntityTypes.productText.isRemoved {
            MyServiceClassMetadata.EntityTypes.productText = metadata.entityType(withName: "ESPM.ProductText")
        }
        if !MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.isRemoved {
            MyServiceClassMetadata.EntityTypes.purchaseOrderHeader = metadata.entityType(withName: "ESPM.PurchaseOrderHeader")
        }
        if !MyServiceClassMetadata.EntityTypes.purchaseOrderItem.isRemoved {
            MyServiceClassMetadata.EntityTypes.purchaseOrderItem = metadata.entityType(withName: "ESPM.PurchaseOrderItem")
        }
        if !MyServiceClassMetadata.EntityTypes.salesOrderHeader.isRemoved {
            MyServiceClassMetadata.EntityTypes.salesOrderHeader = metadata.entityType(withName: "ESPM.SalesOrderHeader")
        }
        if !MyServiceClassMetadata.EntityTypes.salesOrderItem.isRemoved {
            MyServiceClassMetadata.EntityTypes.salesOrderItem = metadata.entityType(withName: "ESPM.SalesOrderItem")
        }
        if !MyServiceClassMetadata.EntityTypes.stock.isRemoved {
            MyServiceClassMetadata.EntityTypes.stock = metadata.entityType(withName: "ESPM.Stock")
        }
        if !MyServiceClassMetadata.EntityTypes.supplier.isRemoved {
            MyServiceClassMetadata.EntityTypes.supplier = metadata.entityType(withName: "ESPM.Supplier")
        }
        if !MyServiceClassMetadata.EntitySets.customers.isRemoved {
            MyServiceClassMetadata.EntitySets.customers = metadata.entitySet(withName: "Customers")
        }
        if !MyServiceClassMetadata.EntitySets.productCategories.isRemoved {
            MyServiceClassMetadata.EntitySets.productCategories = metadata.entitySet(withName: "ProductCategories")
        }
        if !MyServiceClassMetadata.EntitySets.productTexts.isRemoved {
            MyServiceClassMetadata.EntitySets.productTexts = metadata.entitySet(withName: "ProductTexts")
        }
        if !MyServiceClassMetadata.EntitySets.products.isRemoved {
            MyServiceClassMetadata.EntitySets.products = metadata.entitySet(withName: "Products")
        }
        if !MyServiceClassMetadata.EntitySets.purchaseOrderHeaders.isRemoved {
            MyServiceClassMetadata.EntitySets.purchaseOrderHeaders = metadata.entitySet(withName: "PurchaseOrderHeaders")
        }
        if !MyServiceClassMetadata.EntitySets.purchaseOrderItems.isRemoved {
            MyServiceClassMetadata.EntitySets.purchaseOrderItems = metadata.entitySet(withName: "PurchaseOrderItems")
        }
        if !MyServiceClassMetadata.EntitySets.salesOrderHeaders.isRemoved {
            MyServiceClassMetadata.EntitySets.salesOrderHeaders = metadata.entitySet(withName: "SalesOrderHeaders")
        }
        if !MyServiceClassMetadata.EntitySets.salesOrderItems.isRemoved {
            MyServiceClassMetadata.EntitySets.salesOrderItems = metadata.entitySet(withName: "SalesOrderItems")
        }
        if !MyServiceClassMetadata.EntitySets.stock.isRemoved {
            MyServiceClassMetadata.EntitySets.stock = metadata.entitySet(withName: "Stock")
        }
        if !MyServiceClassMetadata.EntitySets.suppliers.isRemoved {
            MyServiceClassMetadata.EntitySets.suppliers = metadata.entitySet(withName: "Suppliers")
        }
        if !MyServiceClassMetadata.ActionImports.generateSamplePurcharOrders.isRemoved {
            MyServiceClassMetadata.ActionImports.generateSamplePurcharOrders = metadata.dataMethod(withName: "GenerateSamplePurcharOrders")
        }
        if !MyServiceClassMetadata.ActionImports.generateSampleSalesOrders.isRemoved {
            MyServiceClassMetadata.ActionImports.generateSampleSalesOrders = metadata.dataMethod(withName: "GenerateSampleSalesOrders")
        }
        if !MyServiceClassMetadata.ActionImports.resetSampleData.isRemoved {
            MyServiceClassMetadata.ActionImports.resetSampleData = metadata.dataMethod(withName: "ResetSampleData")
        }
        if !MyPrefixCustomer.city.isRemoved {
            MyPrefixCustomer.city = MyServiceClassMetadata.EntityTypes.customer.property(withName: "City")
        }
        if !MyPrefixCustomer.country.isRemoved {
            MyPrefixCustomer.country = MyServiceClassMetadata.EntityTypes.customer.property(withName: "Country")
        }
        if !MyPrefixCustomer.customerID.isRemoved {
            MyPrefixCustomer.customerID = MyServiceClassMetadata.EntityTypes.customer.property(withName: "CustomerId")
        }
        if !MyPrefixCustomer.dateOfBirth.isRemoved {
            MyPrefixCustomer.dateOfBirth = MyServiceClassMetadata.EntityTypes.customer.property(withName: "DateOfBirth")
        }
        if !MyPrefixCustomer.emailAddress.isRemoved {
            MyPrefixCustomer.emailAddress = MyServiceClassMetadata.EntityTypes.customer.property(withName: "EmailAddress")
        }
        if !MyPrefixCustomer.firstName.isRemoved {
            MyPrefixCustomer.firstName = MyServiceClassMetadata.EntityTypes.customer.property(withName: "FirstName")
        }
        if !MyPrefixCustomer.houseNumber.isRemoved {
            MyPrefixCustomer.houseNumber = MyServiceClassMetadata.EntityTypes.customer.property(withName: "HouseNumber")
        }
        if !MyPrefixCustomer.lastName.isRemoved {
            MyPrefixCustomer.lastName = MyServiceClassMetadata.EntityTypes.customer.property(withName: "LastName")
        }
        if !MyPrefixCustomer.phoneNumber.isRemoved {
            MyPrefixCustomer.phoneNumber = MyServiceClassMetadata.EntityTypes.customer.property(withName: "PhoneNumber")
        }
        if !MyPrefixCustomer.postalCode.isRemoved {
            MyPrefixCustomer.postalCode = MyServiceClassMetadata.EntityTypes.customer.property(withName: "PostalCode")
        }
        if !MyPrefixCustomer.street.isRemoved {
            MyPrefixCustomer.street = MyServiceClassMetadata.EntityTypes.customer.property(withName: "Street")
        }
        if !MyPrefixCustomer.updatedTimestamp.isRemoved {
            MyPrefixCustomer.updatedTimestamp = MyServiceClassMetadata.EntityTypes.customer.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixProduct.category.isRemoved {
            MyPrefixProduct.category = MyServiceClassMetadata.EntityTypes.product.property(withName: "Category")
        }
        if !MyPrefixProduct.categoryName.isRemoved {
            MyPrefixProduct.categoryName = MyServiceClassMetadata.EntityTypes.product.property(withName: "CategoryName")
        }
        if !MyPrefixProduct.currencyCode.isRemoved {
            MyPrefixProduct.currencyCode = MyServiceClassMetadata.EntityTypes.product.property(withName: "CurrencyCode")
        }
        if !MyPrefixProduct.dimensionDepth.isRemoved {
            MyPrefixProduct.dimensionDepth = MyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionDepth")
        }
        if !MyPrefixProduct.dimensionHeight.isRemoved {
            MyPrefixProduct.dimensionHeight = MyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionHeight")
        }
        if !MyPrefixProduct.dimensionUnit.isRemoved {
            MyPrefixProduct.dimensionUnit = MyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionUnit")
        }
        if !MyPrefixProduct.dimensionWidth.isRemoved {
            MyPrefixProduct.dimensionWidth = MyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionWidth")
        }
        if !MyPrefixProduct.longDescription.isRemoved {
            MyPrefixProduct.longDescription = MyServiceClassMetadata.EntityTypes.product.property(withName: "LongDescription")
        }
        if !MyPrefixProduct.name.isRemoved {
            MyPrefixProduct.name = MyServiceClassMetadata.EntityTypes.product.property(withName: "Name")
        }
        if !MyPrefixProduct.pictureUrl.isRemoved {
            MyPrefixProduct.pictureUrl = MyServiceClassMetadata.EntityTypes.product.property(withName: "PictureUrl")
        }
        if !MyPrefixProduct.price.isRemoved {
            MyPrefixProduct.price = MyServiceClassMetadata.EntityTypes.product.property(withName: "Price")
        }
        if !MyPrefixProduct.productID.isRemoved {
            MyPrefixProduct.productID = MyServiceClassMetadata.EntityTypes.product.property(withName: "ProductId")
        }
        if !MyPrefixProduct.quantityUnit.isRemoved {
            MyPrefixProduct.quantityUnit = MyServiceClassMetadata.EntityTypes.product.property(withName: "QuantityUnit")
        }
        if !MyPrefixProduct.shortDescription.isRemoved {
            MyPrefixProduct.shortDescription = MyServiceClassMetadata.EntityTypes.product.property(withName: "ShortDescription")
        }
        if !MyPrefixProduct.supplierID.isRemoved {
            MyPrefixProduct.supplierID = MyServiceClassMetadata.EntityTypes.product.property(withName: "SupplierId")
        }
        if !MyPrefixProduct.updatedTimestamp.isRemoved {
            MyPrefixProduct.updatedTimestamp = MyServiceClassMetadata.EntityTypes.product.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixProduct.weight.isRemoved {
            MyPrefixProduct.weight = MyServiceClassMetadata.EntityTypes.product.property(withName: "Weight")
        }
        if !MyPrefixProduct.weightUnit.isRemoved {
            MyPrefixProduct.weightUnit = MyServiceClassMetadata.EntityTypes.product.property(withName: "WeightUnit")
        }
        if !MyPrefixProduct.stockDetails.isRemoved {
            MyPrefixProduct.stockDetails = MyServiceClassMetadata.EntityTypes.product.property(withName: "StockDetails")
        }
        if !MyPrefixProduct.supplierDetails.isRemoved {
            MyPrefixProduct.supplierDetails = MyServiceClassMetadata.EntityTypes.product.property(withName: "SupplierDetails")
        }
        if !MyPrefixProductCategory.category.isRemoved {
            MyPrefixProductCategory.category = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "Category")
        }
        if !MyPrefixProductCategory.categoryName.isRemoved {
            MyPrefixProductCategory.categoryName = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "CategoryName")
        }
        if !MyPrefixProductCategory.mainCategory.isRemoved {
            MyPrefixProductCategory.mainCategory = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "MainCategory")
        }
        if !MyPrefixProductCategory.mainCategoryName.isRemoved {
            MyPrefixProductCategory.mainCategoryName = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "MainCategoryName")
        }
        if !MyPrefixProductCategory.numberOfProducts.isRemoved {
            MyPrefixProductCategory.numberOfProducts = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "NumberOfProducts")
        }
        if !MyPrefixProductCategory.updatedTimestamp.isRemoved {
            MyPrefixProductCategory.updatedTimestamp = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixProductText.id.isRemoved {
            MyPrefixProductText.id = MyServiceClassMetadata.EntityTypes.productText.property(withName: "Id")
        }
        if !MyPrefixProductText.language.isRemoved {
            MyPrefixProductText.language = MyServiceClassMetadata.EntityTypes.productText.property(withName: "Language")
        }
        if !MyPrefixProductText.longDescription.isRemoved {
            MyPrefixProductText.longDescription = MyServiceClassMetadata.EntityTypes.productText.property(withName: "LongDescription")
        }
        if !MyPrefixProductText.name.isRemoved {
            MyPrefixProductText.name = MyServiceClassMetadata.EntityTypes.productText.property(withName: "Name")
        }
        if !MyPrefixProductText.productID.isRemoved {
            MyPrefixProductText.productID = MyServiceClassMetadata.EntityTypes.productText.property(withName: "ProductId")
        }
        if !MyPrefixProductText.shortDescription.isRemoved {
            MyPrefixProductText.shortDescription = MyServiceClassMetadata.EntityTypes.productText.property(withName: "ShortDescription")
        }
        if !MyPrefixPurchaseOrderHeader.currencyCode.isRemoved {
            MyPrefixPurchaseOrderHeader.currencyCode = MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "CurrencyCode")
        }
        if !MyPrefixPurchaseOrderHeader.grossAmount.isRemoved {
            MyPrefixPurchaseOrderHeader.grossAmount = MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "GrossAmount")
        }
        if !MyPrefixPurchaseOrderHeader.netAmount.isRemoved {
            MyPrefixPurchaseOrderHeader.netAmount = MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "NetAmount")
        }
        if !MyPrefixPurchaseOrderHeader.purchaseOrderID.isRemoved {
            MyPrefixPurchaseOrderHeader.purchaseOrderID = MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "PurchaseOrderId")
        }
        if !MyPrefixPurchaseOrderHeader.supplierID.isRemoved {
            MyPrefixPurchaseOrderHeader.supplierID = MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "SupplierId")
        }
        if !MyPrefixPurchaseOrderHeader.taxAmount.isRemoved {
            MyPrefixPurchaseOrderHeader.taxAmount = MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "TaxAmount")
        }
        if !MyPrefixPurchaseOrderHeader.items.isRemoved {
            MyPrefixPurchaseOrderHeader.items = MyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Items")
        }
        if !MyPrefixPurchaseOrderItem.currencyCode.isRemoved {
            MyPrefixPurchaseOrderItem.currencyCode = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "CurrencyCode")
        }
        if !MyPrefixPurchaseOrderItem.grossAmount.isRemoved {
            MyPrefixPurchaseOrderItem.grossAmount = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmount")
        }
        if !MyPrefixPurchaseOrderItem.netAmount.isRemoved {
            MyPrefixPurchaseOrderItem.netAmount = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "NetAmount")
        }
        if !MyPrefixPurchaseOrderItem.productID.isRemoved {
            MyPrefixPurchaseOrderItem.productID = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductId")
        }
        if !MyPrefixPurchaseOrderItem.itemNumber.isRemoved {
            MyPrefixPurchaseOrderItem.itemNumber = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ItemNumber")
        }
        if !MyPrefixPurchaseOrderItem.purchaseOrderID.isRemoved {
            MyPrefixPurchaseOrderItem.purchaseOrderID = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "PurchaseOrderId")
        }
        if !MyPrefixPurchaseOrderItem.quantity.isRemoved {
            MyPrefixPurchaseOrderItem.quantity = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "Quantity")
        }
        if !MyPrefixPurchaseOrderItem.quantityUnit.isRemoved {
            MyPrefixPurchaseOrderItem.quantityUnit = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "QuantityUnit")
        }
        if !MyPrefixPurchaseOrderItem.taxAmount.isRemoved {
            MyPrefixPurchaseOrderItem.taxAmount = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "TaxAmount")
        }
        if !MyPrefixPurchaseOrderItem.productDetails.isRemoved {
            MyPrefixPurchaseOrderItem.productDetails = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductDetails")
        }
        if !MyPrefixPurchaseOrderItem.header.isRemoved {
            MyPrefixPurchaseOrderItem.header = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "Header")
        }
        if !MyPrefixSalesOrderHeader.createdAt.isRemoved {
            MyPrefixSalesOrderHeader.createdAt = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "CreatedAt")
        }
        if !MyPrefixSalesOrderHeader.currencyCode.isRemoved {
            MyPrefixSalesOrderHeader.currencyCode = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "CurrencyCode")
        }
        if !MyPrefixSalesOrderHeader.customerID.isRemoved {
            MyPrefixSalesOrderHeader.customerID = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerId")
        }
        if !MyPrefixSalesOrderHeader.grossAmount.isRemoved {
            MyPrefixSalesOrderHeader.grossAmount = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "GrossAmount")
        }
        if !MyPrefixSalesOrderHeader.lifeCycleStatus.isRemoved {
            MyPrefixSalesOrderHeader.lifeCycleStatus = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatus")
        }
        if !MyPrefixSalesOrderHeader.lifeCycleStatusName.isRemoved {
            MyPrefixSalesOrderHeader.lifeCycleStatusName = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatusName")
        }
        if !MyPrefixSalesOrderHeader.netAmount.isRemoved {
            MyPrefixSalesOrderHeader.netAmount = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "NetAmount")
        }
        if !MyPrefixSalesOrderHeader.salesOrderID.isRemoved {
            MyPrefixSalesOrderHeader.salesOrderID = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "SalesOrderId")
        }
        if !MyPrefixSalesOrderHeader.taxAmount.isRemoved {
            MyPrefixSalesOrderHeader.taxAmount = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "TaxAmount")
        }
        if !MyPrefixSalesOrderHeader.customerDetails.isRemoved {
            MyPrefixSalesOrderHeader.customerDetails = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerDetails")
        }
        if !MyPrefixSalesOrderHeader.items.isRemoved {
            MyPrefixSalesOrderHeader.items = MyServiceClassMetadata.EntityTypes.salesOrderHeader.property(withName: "Items")
        }
        if !MyPrefixSalesOrderItem.currencyCode.isRemoved {
            MyPrefixSalesOrderItem.currencyCode = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "CurrencyCode")
        }
        if !MyPrefixSalesOrderItem.deliveryDate.isRemoved {
            MyPrefixSalesOrderItem.deliveryDate = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "DeliveryDate")
        }
        if !MyPrefixSalesOrderItem.grossAmount.isRemoved {
            MyPrefixSalesOrderItem.grossAmount = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "GrossAmount")
        }
        if !MyPrefixSalesOrderItem.itemNumber.isRemoved {
            MyPrefixSalesOrderItem.itemNumber = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ItemNumber")
        }
        if !MyPrefixSalesOrderItem.salesOrderID.isRemoved {
            MyPrefixSalesOrderItem.salesOrderID = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "SalesOrderId")
        }
        if !MyPrefixSalesOrderItem.netAmount.isRemoved {
            MyPrefixSalesOrderItem.netAmount = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "NetAmount")
        }
        if !MyPrefixSalesOrderItem.productID.isRemoved {
            MyPrefixSalesOrderItem.productID = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ProductId")
        }
        if !MyPrefixSalesOrderItem.quantity.isRemoved {
            MyPrefixSalesOrderItem.quantity = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "Quantity")
        }
        if !MyPrefixSalesOrderItem.quantityUnit.isRemoved {
            MyPrefixSalesOrderItem.quantityUnit = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "QuantityUnit")
        }
        if !MyPrefixSalesOrderItem.taxAmount.isRemoved {
            MyPrefixSalesOrderItem.taxAmount = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "TaxAmount")
        }
        if !MyPrefixSalesOrderItem.productDetails.isRemoved {
            MyPrefixSalesOrderItem.productDetails = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "ProductDetails")
        }
        if !MyPrefixSalesOrderItem.header.isRemoved {
            MyPrefixSalesOrderItem.header = MyServiceClassMetadata.EntityTypes.salesOrderItem.property(withName: "Header")
        }
        if !MyPrefixStock.lotSize.isRemoved {
            MyPrefixStock.lotSize = MyServiceClassMetadata.EntityTypes.stock.property(withName: "LotSize")
        }
        if !MyPrefixStock.minStock.isRemoved {
            MyPrefixStock.minStock = MyServiceClassMetadata.EntityTypes.stock.property(withName: "MinStock")
        }
        if !MyPrefixStock.productID.isRemoved {
            MyPrefixStock.productID = MyServiceClassMetadata.EntityTypes.stock.property(withName: "ProductId")
        }
        if !MyPrefixStock.quantity.isRemoved {
            MyPrefixStock.quantity = MyServiceClassMetadata.EntityTypes.stock.property(withName: "Quantity")
        }
        if !MyPrefixStock.quantityLessMin.isRemoved {
            MyPrefixStock.quantityLessMin = MyServiceClassMetadata.EntityTypes.stock.property(withName: "QuantityLessMin")
        }
        if !MyPrefixStock.updatedTimestamp.isRemoved {
            MyPrefixStock.updatedTimestamp = MyServiceClassMetadata.EntityTypes.stock.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixStock.productDetails.isRemoved {
            MyPrefixStock.productDetails = MyServiceClassMetadata.EntityTypes.stock.property(withName: "ProductDetails")
        }
        if !MyPrefixSupplier.city.isRemoved {
            MyPrefixSupplier.city = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "City")
        }
        if !MyPrefixSupplier.country.isRemoved {
            MyPrefixSupplier.country = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "Country")
        }
        if !MyPrefixSupplier.emailAddress.isRemoved {
            MyPrefixSupplier.emailAddress = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "EmailAddress")
        }
        if !MyPrefixSupplier.houseNumber.isRemoved {
            MyPrefixSupplier.houseNumber = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "HouseNumber")
        }
        if !MyPrefixSupplier.phoneNumber.isRemoved {
            MyPrefixSupplier.phoneNumber = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "PhoneNumber")
        }
        if !MyPrefixSupplier.postalCode.isRemoved {
            MyPrefixSupplier.postalCode = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "PostalCode")
        }
        if !MyPrefixSupplier.street.isRemoved {
            MyPrefixSupplier.street = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "Street")
        }
        if !MyPrefixSupplier.supplierID.isRemoved {
            MyPrefixSupplier.supplierID = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "SupplierId")
        }
        if !MyPrefixSupplier.supplierName.isRemoved {
            MyPrefixSupplier.supplierName = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "SupplierName")
        }
        if !MyPrefixSupplier.updatedTimestamp.isRemoved {
            MyPrefixSupplier.updatedTimestamp = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "UpdatedTimestamp")
        }
        if !MyPrefixSupplier.products.isRemoved {
            MyPrefixSupplier.products = MyServiceClassMetadata.EntityTypes.supplier.property(withName: "Products")
        }
    }
}

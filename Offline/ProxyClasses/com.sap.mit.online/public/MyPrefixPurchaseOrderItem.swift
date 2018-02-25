//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

open class MyPrefixPurchaseOrderItem: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var currencyCode: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "CurrencyCode")

    public static var grossAmount: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "GrossAmount")

    public static var netAmount: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "NetAmount")

    public static var productID: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductId")

    public static var itemNumber: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ItemNumber")

    public static var purchaseOrderID: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "PurchaseOrderId")

    public static var quantity: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "Quantity")

    public static var quantityUnit: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "QuantityUnit")

    public static var taxAmount: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "TaxAmount")

    public static var productDetails: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "ProductDetails")

    public static var header: Property = MyServiceClassMetadata.EntityTypes.purchaseOrderItem.property(withName: "Header")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: MyServiceClassMetadata.EntityTypes.purchaseOrderItem)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixPurchaseOrderItem> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixPurchaseOrderItem>())
    }

    open func copy() -> MyPrefixPurchaseOrderItem {
        return CastRequired<MyPrefixPurchaseOrderItem>.from(self.copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var header: MyPrefixPurchaseOrderHeader? {
        get {
            return CastOptional<MyPrefixPurchaseOrderHeader>.from(self.optionalValue(for: MyPrefixPurchaseOrderItem.header))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.header, to: value)
        }
    }

    override open var isProxy: Bool {
        get {
            return true
        }
    }

    open var itemNumber: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.itemNumber))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.itemNumber, to: IntValue.of(optional: value))
        }
    }

    open class func key(itemNumber: Int?, purchaseOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "ItemNumber", value: IntValue.of(optional: itemNumber)).with(name: "PurchaseOrderId", value: StringValue.of(optional: purchaseOrderID))
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: MyPrefixPurchaseOrderItem {
        get {
            return CastRequired<MyPrefixPurchaseOrderItem>.from(self.oldEntity)
        }
    }

    open var productDetails: MyPrefixProduct? {
        get {
            return CastOptional<MyPrefixProduct>.from(self.optionalValue(for: MyPrefixPurchaseOrderItem.productDetails))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.productDetails, to: value)
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.productID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.productID, to: StringValue.of(optional: value))
        }
    }

    open var purchaseOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.purchaseOrderID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.purchaseOrderID, to: StringValue.of(optional: value))
        }
    }

    open var quantity: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.quantity))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.quantity, to: DecimalValue.of(optional: value))
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.quantityUnit))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderItem.taxAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderItem.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}

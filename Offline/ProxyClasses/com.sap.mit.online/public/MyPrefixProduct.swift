//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

open class MyPrefixProduct: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var category: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "Category")

    public static var categoryName: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "CategoryName")

    public static var currencyCode: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "CurrencyCode")

    public static var dimensionDepth: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionDepth")

    public static var dimensionHeight: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionHeight")

    public static var dimensionUnit: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionUnit")

    public static var dimensionWidth: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "DimensionWidth")

    public static var longDescription: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "LongDescription")

    public static var name: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "Name")

    public static var pictureUrl: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "PictureUrl")

    public static var price: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "Price")

    public static var productID: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "ProductId")

    public static var quantityUnit: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "QuantityUnit")

    public static var shortDescription: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "ShortDescription")

    public static var supplierID: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "SupplierId")

    public static var updatedTimestamp: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "UpdatedTimestamp")

    public static var weight: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "Weight")

    public static var weightUnit: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "WeightUnit")

    public static var stockDetails: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "StockDetails")

    public static var supplierDetails: Property = MyServiceClassMetadata.EntityTypes.product.property(withName: "SupplierDetails")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: MyServiceClassMetadata.EntityTypes.product)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixProduct> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixProduct>())
    }

    open var category: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.category))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.category, to: StringValue.of(optional: value))
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> MyPrefixProduct {
        return CastRequired<MyPrefixProduct>.from(self.copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var dimensionDepth: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixProduct.dimensionDepth))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.dimensionDepth, to: DecimalValue.of(optional: value))
        }
    }

    open var dimensionHeight: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixProduct.dimensionHeight))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.dimensionHeight, to: DecimalValue.of(optional: value))
        }
    }

    open var dimensionUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.dimensionUnit))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.dimensionUnit, to: StringValue.of(optional: value))
        }
    }

    open var dimensionWidth: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixProduct.dimensionWidth))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.dimensionWidth, to: DecimalValue.of(optional: value))
        }
    }

    override open var isProxy: Bool {
        get {
            return true
        }
    }

    open class func key(productID: String?) -> EntityKey {
        return EntityKey().with(name: "ProductId", value: StringValue.of(optional: productID))
    }

    open var longDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.longDescription))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.longDescription, to: StringValue.of(optional: value))
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.name))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.name, to: StringValue.of(optional: value))
        }
    }

    open var old: MyPrefixProduct {
        get {
            return CastRequired<MyPrefixProduct>.from(self.oldEntity)
        }
    }

    open var pictureUrl: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.pictureUrl))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.pictureUrl, to: StringValue.of(optional: value))
        }
    }

    open var price: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixProduct.price))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.price, to: DecimalValue.of(optional: value))
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.productID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.productID, to: StringValue.of(optional: value))
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.quantityUnit))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open var shortDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.shortDescription))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.shortDescription, to: StringValue.of(optional: value))
        }
    }

    open var stockDetails: MyPrefixStock? {
        get {
            return CastOptional<MyPrefixStock>.from(self.optionalValue(for: MyPrefixProduct.stockDetails))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.stockDetails, to: value)
        }
    }

    open var supplierDetails: MyPrefixSupplier? {
        get {
            return CastOptional<MyPrefixSupplier>.from(self.optionalValue(for: MyPrefixProduct.supplierDetails))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.supplierDetails, to: value)
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.supplierID, to: StringValue.of(optional: value))
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: MyPrefixProduct.updatedTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.updatedTimestamp, to: value)
        }
    }

    open var weight: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixProduct.weight))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.weight, to: DecimalValue.of(optional: value))
        }
    }

    open var weightUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProduct.weightUnit))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProduct.weightUnit, to: StringValue.of(optional: value))
        }
    }
}

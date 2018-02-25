//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

open class MyPrefixProductCategory: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var category: Property = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "Category")

    public static var categoryName: Property = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "CategoryName")

    public static var mainCategory: Property = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "MainCategory")

    public static var mainCategoryName: Property = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "MainCategoryName")

    public static var numberOfProducts: Property = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "NumberOfProducts")

    public static var updatedTimestamp: Property = MyServiceClassMetadata.EntityTypes.productCategory.property(withName: "UpdatedTimestamp")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: MyServiceClassMetadata.EntityTypes.productCategory)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixProductCategory> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixProductCategory>())
    }

    open var category: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductCategory.category))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductCategory.category, to: StringValue.of(optional: value))
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductCategory.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductCategory.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> MyPrefixProductCategory {
        return CastRequired<MyPrefixProductCategory>.from(self.copyEntity())
    }

    override open var isProxy: Bool {
        get {
            return true
        }
    }

    open class func key(category: String?) -> EntityKey {
        return EntityKey().with(name: "Category", value: StringValue.of(optional: category))
    }

    open var mainCategory: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductCategory.mainCategory))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductCategory.mainCategory, to: StringValue.of(optional: value))
        }
    }

    open var mainCategoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductCategory.mainCategoryName))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductCategory.mainCategoryName, to: StringValue.of(optional: value))
        }
    }

    open var numberOfProducts: Int64? {
        get {
            return LongValue.optional(self.optionalValue(for: MyPrefixProductCategory.numberOfProducts))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductCategory.numberOfProducts, to: LongValue.of(optional: value))
        }
    }

    open var old: MyPrefixProductCategory {
        get {
            return CastRequired<MyPrefixProductCategory>.from(self.oldEntity)
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: MyPrefixProductCategory.updatedTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductCategory.updatedTimestamp, to: value)
        }
    }
}

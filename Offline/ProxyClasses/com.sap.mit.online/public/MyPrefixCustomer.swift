//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

open class MyPrefixCustomer: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var city: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "City")

    public static var country: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "Country")

    public static var customerID: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "CustomerId")

    public static var dateOfBirth: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "DateOfBirth")

    public static var emailAddress: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "EmailAddress")

    public static var firstName: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "FirstName")

    public static var houseNumber: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "HouseNumber")

    public static var lastName: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "LastName")

    public static var phoneNumber: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "PhoneNumber")

    public static var postalCode: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "PostalCode")

    public static var street: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "Street")

    public static var updatedTimestamp: Property = MyServiceClassMetadata.EntityTypes.customer.property(withName: "UpdatedTimestamp")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: MyServiceClassMetadata.EntityTypes.customer)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixCustomer> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixCustomer>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.city))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> MyPrefixCustomer {
        return CastRequired<MyPrefixCustomer>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.country))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.country, to: StringValue.of(optional: value))
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.customerID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.customerID, to: StringValue.of(optional: value))
        }
    }

    open var dateOfBirth: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: MyPrefixCustomer.dateOfBirth))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.dateOfBirth, to: value)
        }
    }

    open var emailAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.emailAddress))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.emailAddress, to: StringValue.of(optional: value))
        }
    }

    open var firstName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.firstName))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.firstName, to: StringValue.of(optional: value))
        }
    }

    open var houseNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.houseNumber))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.houseNumber, to: StringValue.of(optional: value))
        }
    }

    override open var isProxy: Bool {
        get {
            return true
        }
    }

    open class func key(customerID: String?) -> EntityKey {
        return EntityKey().with(name: "CustomerId", value: StringValue.of(optional: customerID))
    }

    open var lastName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.lastName))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.lastName, to: StringValue.of(optional: value))
        }
    }

    open var old: MyPrefixCustomer {
        get {
            return CastRequired<MyPrefixCustomer>.from(self.oldEntity)
        }
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.phoneNumber))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.phoneNumber, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var street: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixCustomer.street))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.street, to: StringValue.of(optional: value))
        }
    }

    open var updatedTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: MyPrefixCustomer.updatedTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixCustomer.updatedTimestamp, to: value)
        }
    }
}

//# xsc 18.1.0-SNAPSHOT-37f80a-20180124

import Foundation
import SAPOData

internal class MyServiceClassMetadataParser {
    internal static let options: Int = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = MyServiceClassMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = MyServiceClassMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(MyServiceClassMetadataText.xml, url: "ESPM")
        metadata.proxyVersion = "18.1.0-SNAPSHOT-37f80a-20180124"
        return metadata
    }
}

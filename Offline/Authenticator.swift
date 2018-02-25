//
//  Authenticator.swift
//  Offline
//
//  Copyright © 2016. SAP. All rights reserved.
//

import Foundation
import UIKit
import SAPFoundation

/// Keeps reference and configures the HCPURLSession should be used by all the components to communicate with the backend
class Authenticator: NSObject, SAPURLSessionDelegate {

    struct Constants {
        static let appID = "net.netconomy.dummy"
        static let connectionID = "net.netconomy.dummy"
        private static let sapcpmsURLString = "https://hcpms-s0018675195trial.hanatrial.ondemand.com/"
        static let sapcpmsURL = URL(string: sapcpmsURLString)!
        static let appURL = sapcpmsURL.appendingPathComponent(connectionID)
        static let samlAuthURL = URL(string: "\(sapcpmsURL.absoluteString)SAMLAuthLauncher")!
        static let samlFinishURL = URL(string: "\(sapcpmsURL.absoluteString)SAMLAuthLauncher?finishEndpointParam=someUnusedValue")!
    }

    enum AuthenticationError: LocalizedError {
        case alreadyInProgress

        var errorDescription: String? {
            switch self {
            case .alreadyInProgress: return "Another authentication operation is already in progress."
            }
        }
    }

    enum Result {
        case success
        case error(Error?)
    }

    private var store: SecureKeyValueStore!
    private let encryptionKey = "encryptionKey" // for dev purposes only
    private var shouldRestartAuthentication: Bool = false

    var urlSession: SAPURLSession!
    var username: String!
    var password: String!

    var authCompletion: ((Result) -> Void)!

    init(urlSession: SAPURLSession) {
        super.init()
        self.urlSession = urlSession
    }

    /// actual authentication call to the server
    ///
    /// - Parameters:
    ///   - completionHandler: The closure to be called when authentication completes
    ///   - error: If an error occurs during authentication, this will be set
    ///     to the error. Otherwise, this will be `nil`.
    public func authenticate(completionHandler: @escaping (_ error: Error?) -> Void) {
        // don't allow to run more simultaneous

        let samlAuthenticationParameters = SAMLAuthenticationParameters(authorizationEndpointURL: Constants.samlAuthURL, finishEndpointURL: Constants.samlFinishURL)
        let samlAuthenticator = SAMLAuthenticator(authenticationParameters: samlAuthenticationParameters)
        let samlObserver = SAMLObserver(authenticator: samlAuthenticator)
        urlSession.register(samlObserver)

        samlAuthenticator.authenticate(completionHandler: completionHandler)
    }

}

//
//  StartScreenViewController.swift
//  Authentication
//
//  Created by Lechner, Sami on 02/03/2017.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit
import SAPFoundation
import SAPCommon

class StartScreenViewController: UIViewController, SAPURLSessionDelegate {

    @IBOutlet var infoText: UITextView!

    enum AuthenticationState {
        case notYetStarted
        case started
        case succeeded
        case failed
    }

    var currentAuthenticationState = AuthenticationState.notYetStarted
    var oDataModel: ODataModel?
    /// the variable in the AppDelegate holding the current active session to the HCP
    var urlSession: SAPURLSession? {
        didSet {
            oDataModel = ODataModel(urlSession: urlSession!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        urlSession = SAPURLSession(delegate: self)
        let httpObserver = SAPcpmsObserver(applicationID: Authenticator.Constants.appID)
        urlSession?.register(httpObserver)
        infoText.text = "Authentication about to start"
    }

    /// Statemachine handles the loging with the the SAP IDP
    override func viewDidAppear(_: Bool) {
        switch currentAuthenticationState {
        /// the inital state so the SAML authentication is triggered
        case .notYetStarted:
            currentAuthenticationState = .started
            infoText.text = "Authentication started"
            Authenticator(urlSession: urlSession!).authenticate { error in
                OperationQueue.main.addOperation {
                    /// the SAML Authentication was successfull load next screen
                    if let error = error {
                        self.currentAuthenticationState = .failed
                        self.infoText.text = error.localizedDescription
                        
                    }else
                    {
                        /// the SAML Authentication was successfull load next screen
                        self.currentAuthenticationState = .succeeded
                        self.performSegue(withIdentifier: "authenticationSuccessfull", sender: nil)
                    }
                }
            }
            break
        /// the SAML authentication was successful load next screen
        case .succeeded:
            performSegue(withIdentifier: "authenticationSuccessfull", sender: nil)
            infoText.text = "Authentication was successful"
            break
        default:
            infoText.text = "Authentication in Progress"
        }
    }
    /// Handler to prepare the segue
    ///
    /// - Parameters:
    ///   - segue:
    ///   - sender:
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "authenticationSuccessfull" {

            let view = segue.destination as! UINavigationController
            let activeView = view.topViewController as! HomeViewViewController
            activeView.initialize(oDataModel: oDataModel!)
        }
    }
}

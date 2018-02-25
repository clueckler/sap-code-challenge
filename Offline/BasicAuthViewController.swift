//
// BasicAuthViewController.swift
// Offline
//
//  Copyright © 2016. SAP. All rights reserved.
//

import UIKit
import SAPFoundation
import SAPCommon

class BasicAuthViewController: UIViewController, URLSessionTaskDelegate, UITextFieldDelegate {
    
    private let logger: Logger = Logger.shared(named: "BasicAuthenticationLogger")
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var activeTextField: UITextField?
    
    var loginHandler : ((String, String) -> Void)!
    
    @IBAction func loginButtonTapped(_ sender: AnyObject) {
        
        // Validate the input Fields
        guard let username = self.usernameTextField.text, username.characters.count > 0,
            let password = self.passwordTextField.text, password.characters.count > 0  else {
            displayAlert(title: "Error", message: "Username or Password is invalid", buttonText: "Ok")
            return
        }
        
        loginHandler(username, password)
        
        self.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Notification for keyboard show/hide
        self.subscribeForKeyboardNotifications()
    }
    
    override func viewDidLoad() {
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.unsubscribeFromKeyboardNotifications()
    }
    
    // Shrink Table if keyboard show notification comes
    override func keyboardWillShow(notification: NSNotification) {
        self.scrollView.isScrollEnabled = true
        if let info = notification.userInfo, let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size {
            // Need to calculate keyboard exact size due to Apple suggestions
            let contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
            
            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets
            
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.height
            if let activeField = self.activeTextField, (!self.view.frame.contains(activeField.frame.origin)) {
                let scrollPoint = CGPoint(x: 0, y: activeField.frame.origin.y - keyboardSize.height)
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
                self.scrollView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }
    
    // Resize Table if keyboard hide notification comes
    override func keyboardWillHide(notification: NSNotification) {
        // Once keyboard disappears, restore original positions
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.scrollView.isScrollEnabled = false
    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.activeTextField?.resignFirstResponder()
        return true
    }
    



}

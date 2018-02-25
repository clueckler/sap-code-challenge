//
// EditableCell.swift
// Online
//
//  Copyright © 2016 SAP. All rights reserved.
//

import Foundation
import UIKit

// This type of UITableViewCell is used in cases when we want to edit
// the value for a property shown on detail view
// A Cell object, using a titleLabel and a textfield for value
class EditableCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var valueTextField: UITextField! {
        didSet {
            valueTextField.delegate = self
        }
    }

    @IBOutlet var unitLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    // Initialisation of changeHandler. It's overridden when setting the object's properties
    var changeHandler: ((String) -> Bool)!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func textFieldDidBeginEditing(_: UITextField) {
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
    }

    func textFieldDidEndEditing(_: UITextField) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
    }

    @objc func textFieldDidChange(sender: AnyObject) {
        if let notification = sender as? NSNotification, let textFieldChanged = notification.object as? UITextField, textFieldChanged == self.valueTextField {

            //            if let text = textFieldChanged.text, !changeHandler(text) {
            //                textFieldChanged.textColor = UIColor.red
            //            } else {
            //                textFieldChanged.textColor = UIColor.black
            //            }
        }
    }

    // Case when there is iOS keyboard and Return is pressed
    // This runs before textfieldDidEndEditing
    func textFieldShouldReturn(_: UITextField) -> Bool {
        // use to make the view or any subview that is the first responder resign (optionally force)
        valueTextField.endEditing(true)
        valueTextField.resignFirstResponder()
        return true
    }
}

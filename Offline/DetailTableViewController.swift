//
//  DetailTableViewController.swift
//  Online
//
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit
import SAPFiori

class DetailTableViewController: UIViewController, Notifier, URLSessionTaskDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {

    private var detailItem: MyPrefixProduct!
    private var oDataModel: ODataModel?

    func initialize(oDataModel: ODataModel) {
        self.oDataModel = oDataModel
    }

    @IBOutlet var DetailTable: UITableView!

    /// Delegate function from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailTable.delegate = self
        DetailTable.dataSource = self
        if (detailItem != nil) {
            let objectHeader = FUIObjectHeader() 
            //        objectHeader.detailImageView.image = #imageLiteral(resourceName: "ProfilePic")
            
            objectHeader.headlineLabel.text = detailItem.name
            objectHeader.subheadlineLabel.text = "\(detailItem.price!.toString()) \(String(describing: detailItem.currencyCode))"
            objectHeader.footnoteLabel.text = detailItem.categoryName
            objectHeader.descriptionLabel.text = detailItem.longDescription
            
            objectHeader.statusLabel.text = detailItem.supplierID
            DetailTable.tableHeaderView = objectHeader
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameter tableView:
    /// - Returns: that this table only will have 1 section
    func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - section:
    /// - Returns: returns the number of rows the table should have
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 3 // your number of cell here
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - indexPath:
    /// - Returns: fills the cells with the Salesorder
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! EditableCell
        
        switch indexPath.row {
        case 0:
            cell.unitLabel?.text = detailItem.dimensionUnit
            cell.titleLabel.text = "Depth"
            cell.valueTextField.text = detailItem.dimensionDepth?.toString()
            break
        case 1:
            cell.unitLabel?.text = detailItem.dimensionUnit
            cell.titleLabel.text = "Width"
            cell.valueTextField.text = detailItem.dimensionWidth?.toString()
            break
        case 2:
            cell.unitLabel?.text = detailItem.dimensionUnit
            cell.titleLabel.text = "Height"
            cell.valueTextField.text = detailItem.dimensionHeight?.toString()
            break
        default: break

        }
        cell.valueTextField.allowsEditingTextAttributes = false

        return cell

    }

    /// loads the current salesorderItem
    ///
    /// - Parameter newItems: the current salesorderItem
    func loadSalesOrderItem(item: MyPrefixProduct) {
        detailItem = item
    }


}

//
//  ProductDetailViewController.swift
//  Offline
//
//  Created by Christoph Lückler on 25.02.18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFiori

class ProductDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var part: Part!
    @IBOutlet weak var tableView: UITableView!
    
    /// Delegate function from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        let objectHeader = FUIObjectHeader()
            
        objectHeader.headlineLabel.text = part.name
        objectHeader.subheadlineLabel.text = "\(part.price) \(part.currencyCode)"
        objectHeader.footnoteLabel.text = part.categoryName
        objectHeader.descriptionLabel.text = part.longDescription
        
        objectHeader.statusLabel.text = part.supplierID
        tableView.tableHeaderView = objectHeader
    }
    
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartCell", for: indexPath) as! EditableCell
        
        switch indexPath.row {
        case 0:
            cell.unitLabel?.text = part.dimensionUnit
            cell.titleLabel.text = "Depth"
            cell.valueTextField.text = part.depth
            break
        case 1:
            cell.unitLabel?.text = part.dimensionUnit
            cell.titleLabel.text = "Width"
            cell.valueTextField.text = part.width
            break
        case 2:
            cell.unitLabel?.text = part.dimensionUnit
            cell.titleLabel.text = "Height"
            cell.valueTextField.text = part.height
            break
        default: break
            
        }
        cell.valueTextField.allowsEditingTextAttributes = false
        
        return cell
    }
    
    func load(part: Part) {
        self.part = part
    }
}

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

    @IBOutlet weak var orderButton: UIBarButtonItem!
    var part: Part!
    var showOrder = false
    @IBOutlet weak var tableView: UITableView!
    
    /// Delegate function from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        let objectHeader = FUIObjectHeader()
        
        self.title = part.name
            
        objectHeader.headlineLabel.text = part.partID
        objectHeader.subheadlineLabel.text = part.name
        objectHeader.footnoteLabel.text = part.categoryName
        objectHeader.descriptionLabel.text = part.longDescription
        objectHeader.substatusLabel.text = part.supplierID
        
        objectHeader.statusLabel.text = part.price
        tableView.tableHeaderView = objectHeader
        
        
        if !showOrder {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    @IBAction func orderMoreParts(_ sender: Any) {
        let controller =  UIAlertController(title: "Success", message: "More parts are on their way. You'll receive a notification when they are ready to collect at the warehouse.", preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            controller.dismiss(animated: true, completion: nil)
        }))
        
        present(controller, animated: true, completion: nil)
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

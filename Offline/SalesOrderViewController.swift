//
//  SalesOrderViewController
//  Online
//
//  Copyright © 2016 SAP. All rights reserved.
//

import SAPFoundation
import UIKit
import SAPFiori

protocol TaskViewControllerDelegate: class {
    func didCloseTask()
}

class SalesOrderViewController: UIViewController, URLSessionTaskDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var SalesOrderTable: UITableView!
    
    weak var delegate: TaskViewControllerDelegate?
    
    private var task: Task!

    private var parts = [Part]()
    private var oDataModel: ODataModel?

    func initialize(oDataModel: ODataModel) {
        self.oDataModel = oDataModel
    }

    /// delegate function from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view
        oDataModel!.loadParts(for: task)  { resultParts, error in
            self.parts = resultParts ?? []

            OperationQueue.main.addOperation {
                self.SalesOrderTable.reloadData()
            }
        }

        if (task != nil) {
            let objectHeader = FUIObjectHeader()
            //        objectHeader.detailImageView.image = #imageLiteral(resourceName: "ProfilePic")
            
            objectHeader.headlineLabel.text = task.taskID
//            objectHeader.subheadlineLabel.text = "\(task.grossAmount) \(task.currencyCode ?? "EUR")"
//        objectHeader.tags = [FUITag(title: "Started"), FUITag(title: "PM01"), FUITag(title: "103-Repair")]
            objectHeader.bodyLabel.text = task.lifeCycleStatusName
            objectHeader.descriptionLabel.text = "Make sure to wear a safety vest."
            objectHeader.statusLabel.text = "High"

            SalesOrderTable.tableHeaderView = objectHeader
        }
    }
    
    @IBAction func updateStatus(_ sender: Any) {
        do {
            try oDataModel!.updateTask(status: "Close", task: task)
            
            self.navigationController?.popToRootViewController(animated: true)
        } catch  {
            let alert = UIAlertController(title: "Alert", message: "Updating the Status went south!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameter tableView:
    /// - Returns: that this table only will have 1 section
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - section:
    /// - Returns: returns the number of rows the table should have
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return parts.count // your number of cell here
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - indexPath:
    /// - Returns: fills the cells with the Sales order
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalesOrderCell", for: indexPath)
        let singlePart = parts[indexPath.row]
        cell.textLabel?.text = singlePart.partID
        cell.detailTextLabel?.text = (singlePart.name + " - " + singlePart.categoryName)

        return cell
    }

    func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
    }

    /// Handler to prepare the segue
    ///
    /// - Parameters:
    ///   - segue:
    ///   - sender:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSalesOrderItem" {
            /// check email to implement this via sender
//            let selectedRow = sender as! UITableViewCell
//            let selectedIndexPath = SalesOrderTable.indexPath(for: selectedRow)!
//            let order: MyPrefixProduct = products[selectedIndexPath.row]
//            let itemViewControler = segue.destination as! SalesOrderItemViewController
//            itemViewControler.initialize(oDataModel: oDataModel!)
//            itemViewControler.loadSalesOrderItems(newItems: order)
        }
    }
    /// loads the current salesorderItem
    ///
    /// - Parameter newItems: the current salesorderItem
    public func load(task: Task) {
        self.task = task
    }
}

//
//  TaskDetailViewController.swift
//  Offline
//
//  Created by Christoph Lückler on 25.02.18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFiori

protocol TaskDetailViewControllerDelegate: class {
    func didCloseTask()
}

class TaskDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: TaskDetailViewControllerDelegate?
    
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
            
            OperationQueue.main.addOperation { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
        if (task != nil) {
            let objectHeader = FUIObjectHeader()
            
            objectHeader.headlineLabel.text = task.taskID
            objectHeader.bodyLabel.text = task.lifeCycleStatusName
            objectHeader.descriptionLabel.text = "Make sure to wear a safety vest."
            objectHeader.statusLabel.text = "High"
            
            tableView.tableHeaderView = objectHeader
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
    
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return parts.count // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartCell", for: indexPath)
        let singlePart = parts[indexPath.row]
        cell.textLabel?.text = singlePart.partID
        cell.detailTextLabel?.text = (singlePart.name + " - " + singlePart.categoryName)
        
        return cell
    }
    
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "partDetailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "partDetailSegue", let indexPath = sender as? IndexPath {
            let part = parts[indexPath.row]
            let vc = segue.destination as! ProductDetailViewController
            vc.load(part: part)
        }
    }

    public func load(task: Task) {
        self.task = task
    }
}

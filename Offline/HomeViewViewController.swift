//
//  HomeViewViewController.swift
//  Offline
//
//  Created by Lechner, Sami on 07.02.18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit

class HomeViewViewController: UIViewController, URLSessionTaskDelegate, UITableViewDataSource, UITableViewDelegate, ActivityIndicator {
    
    
    @IBOutlet weak var HomeTableView: UITableView!
    private var oDataModel: ODataModel?
    private var salesOrders = [MyPrefixSalesOrderHeader]()
    private var products = [MyPrefixProduct]()
    private var activityIndicator: UIActivityIndicatorView!
    private let refreshControl = UIRefreshControl()
    
    func initialize(oDataModel: ODataModel) {
        self.oDataModel = oDataModel
    }


    override func viewDidLoad() {
        HomeTableView.dataSource = self
        HomeTableView.delegate = self
        super.viewDidLoad()
        activityIndicator = initActivityIndicator()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
        showActivityIndicator(activityIndicator)
        
        oDataModel?.openOfflineStore { result in
            OperationQueue.main.addOperation {
                self.loadData()
            }
        }
        HomeTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshOfflineData(_:)), for: .valueChanged)
    }
    @objc private func refreshOfflineData(_ sender: Any) {
        // Fetch Weather Data
        self.oDataModel?.downloadOfflineStore{ error in
            
            OperationQueue.main.addOperation {
                self.loadData()
                self.refreshControl.endRefreshing()
            }
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
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return salesOrders.count
            
        }
        return products.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OpenTicketCell", for: indexPath)
        if indexPath.section == 0 {
            let singleOrder = salesOrders[indexPath.row]
            
            cell.textLabel?.text = singleOrder.salesOrderID
            cell.detailTextLabel?.text = (singleOrder.taxAmount?.toString())! + singleOrder.currencyCode!
        }else{
            let  singleProduct = products[indexPath.row]
            
            cell.textLabel?.text = "\(singleProduct.name!) \(singleProduct.categoryName!)"
            cell.detailTextLabel?.text = (singleProduct.price?.toString())! + singleProduct.currencyCode!
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "openTickets"
        default:
            return "Equipment"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "Tickets", sender: indexPath)
            break;
        default:
            performSegue(withIdentifier: "Equipment", sender: indexPath)
        }
    }
    /// Handler to prepare the segue
    ///
    /// - Parameters:
    ///   - segue:
    ///   - sender:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Tickets" {
            let indexPath = sender as! IndexPath
            let order: MyPrefixSalesOrderHeader = salesOrders[indexPath.row]
            let sOviewControler = segue.destination as! SalesOrderViewController
            sOviewControler.initialize(oDataModel: oDataModel!)
            sOviewControler.loadSalesOrderItems(newItem: order)
            
        }
        if segue.identifier == "Equipment" {
            
            let indexPath = sender as! IndexPath
            let equipment: MyPrefixProduct = products[indexPath.row]
            let sDetailControler = segue.destination as! DetailTableViewController
            sDetailControler.initialize(oDataModel: oDataModel!)
            sDetailControler.loadSalesOrderItem(item: equipment)
            
        }
        
    }
    private func loadData() {
        self.oDataModel!.loadSalesOpenOrders { resultSalesOrders, error in
            
            if error != nil {
                // handle error in future version
            }
            if let tempSalesOrders = resultSalesOrders {
                self.salesOrders = tempSalesOrders
            }
            OperationQueue.main.addOperation {
                self.HomeTableView.reloadData()
                
            }
        }
        self.oDataModel!.loadProdcuts{ resultProducts, error in
            
            if error != nil {
                // handle error in future version
            }
            if let tempProducts = resultProducts {
                self.products = tempProducts
            }
            OperationQueue.main.addOperation {
                self.HomeTableView.reloadData()
                
            }
            self.hideActivityIndicator(self.activityIndicator)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    /// the function corrects the data to reflect the challange at the MVC 2017
    @IBAction func resetData(_ sender: Any) {


        for equipment in products {
            var dirty = false;
            switch equipment.category {
                
            case "Portable Players"?, "Graphic Cards"?:
                let newCategory : String = "Control System"
                equipment.categoryName = newCategory
                equipment.category = newCategory
                equipment.name = equipment.name?.replacingOccurrences(of: "DVD Player", with: "Controler")
                dirty = true;
                break;
            case "Scanners"?, "Keyboards"?:
                let newCategory : String = "Radio Scanners"
                equipment.categoryName = newCategory
                equipment.category = newCategory
                equipment.name = equipment.name?.replacingOccurrences(of: "Photo", with: "Radio")
                equipment.shortDescription = equipment.shortDescription?.replacingOccurrences(of: "Flatbed", with: "Radio")
                equipment.longDescription = equipment.longDescription?.replacingOccurrences(of: "Flatbed", with: "Radio")
                dirty = true;
                break;
            case "MP3 Players"?, "Mousepads"? , "Mice"?:
                let newCategory : String = "Antenna"
                equipment.categoryName = newCategory
                equipment.category = newCategory
                equipment.name = equipment.name?.replacingOccurrences(of: "Player", with: "Antenna")
                equipment.name = equipment.name?.replacingOccurrences(of: "Mousepad", with: "Antenna")
                equipment.shortDescription = equipment.shortDescription?.replacingOccurrences(of: "MP3 Players", with: "Antenna")
                equipment.longDescription = equipment.longDescription?.replacingOccurrences(of: "MP3 Players", with: "Antenna")
                dirty = true;
                break;
            case "Notebooks"?, "Multifunction Printers"?:
                let newCategory : String = "Transceiver"
                equipment.categoryName = newCategory
                equipment.category = newCategory
                equipment.name = equipment.name?.replacingOccurrences(of: "Notebook", with: "Transceiver")
                equipment.shortDescription = equipment.shortDescription?.replacingOccurrences(of: "Notebook", with: "Transceiver")
                equipment.longDescription = equipment.longDescription?.replacingOccurrences(of: "Notebook", with: "Transceiver")
                dirty = true;
                break;
            case "Software"?:
                let newCategory : String = "Power Amplifier"
                equipment.categoryName = newCategory
                equipment.category = newCategory
                equipment.name =  "Power Amplifier"
                dirty = true;
                break;
            case "Projectors"?, "Ink Jet Printers"?:
                let newCategory : String = "Multiplexer"
                equipment.categoryName = newCategory
                equipment.category = newCategory
                dirty = true;
                break;
            case "Tablets"?, "Flat Screen TVs"?, "Flat Screen Monitors"?:
                let newCategory : String = "Solar Panel"
                equipment.categoryName = newCategory
                equipment.category = newCategory
                equipment.name = "Solar Panel"
                dirty = true;
                break;
            case "PCs"?, "Laser Printers"?:
                let newCategory : String = "Diesel Generator"
                equipment.categoryName = newCategory
                equipment.category = newCategory
                equipment.name = equipment.name?.replacingOccurrences(of: "PC", with: "Diesel Generator")
                dirty = true;
                break;

            default :
                break
            }
            if(dirty){
                do {
                    try oDataModel?.updateProduct(currentProduct: equipment)
                }
                catch{
                    let alert = UIAlertController(title: "Alert", message: "Updating Product went south!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                    }))
                }

            }


        }
    }
}

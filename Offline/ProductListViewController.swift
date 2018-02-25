//
//  ProductListViewController.swift
//  Offline
//
//  Created by Christoph Lückler on 25.02.18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFiori

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var parts: [Part] = []

    // MARK: Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.customInit()
    }
    
    private func customInit() {
        // Configure tabBarItem
        self.tabBarItem = UITabBarItem(title: "Products",
                                       image: FUIIconLibrary.system.library.withRenderingMode(.alwaysTemplate),
                                       tag: 0)
    }

    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return parts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! FUIObjectTableViewCell
        
        let singlePart = parts[indexPath.row]
        
        cell.headlineText = singlePart.partID
        cell.subheadlineText = (singlePart.name + " - " + singlePart.categoryName)
        cell.accessoryType = .disclosureIndicator
        
        oDataModel.offlineService.downloadMedia(entity: singlePart.entity) { (data, error) in
            cell.detailImage = UIImage(data: data ?? Data())
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "partDetailSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "partDetailSegue", let indexPath = sender as? IndexPath {
            let part = parts[indexPath.row]
            let vc = segue.destination as! ProductDetailViewController
            vc.load(part: part)
        }
    }
    
    // MARK: View life cylce
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        
        self.title = "Products"
        oDataModel.loadAllParts { [weak self] (parts, error) in
            self?.parts = parts ?? []
            self?.tableView.reloadData()
        }

        // Do any additional setup after loading the view.
    }

}

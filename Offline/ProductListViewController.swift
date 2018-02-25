//
//  ProductListViewController.swift
//  Offline
//
//  Created by Christoph Lückler on 25.02.18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SAPFiori

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
    
    // MARK: View life cylce
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

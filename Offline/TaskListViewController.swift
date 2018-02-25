//
//  TaskListViewController.swift
//  Offline
//
//  Created by Christoph Lückler on 25.02.18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import MapKit
import SAPFiori

struct DummyData {
    
    var title: String
    var coordinate: CLLocationCoordinate2D
}

class TaskListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    var toolbar: FUIMapToolbar!
    
    var tasks = [DummyData]()
    var locationManager: CLLocationManager?
    
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
        self.tabBarItem = UITabBarItem(title: "Tasks",
                                       image: FUIIconLibrary.system.listView.withRenderingMode(.alwaysTemplate),
                                       tag: 0)
        
        // Setup location manager
        let manager = CLLocationManager()
        manager.delegate = self
        self.locationManager = manager
    }
    
    // MARK: View life cylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        self.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        self.mapView.register(TaskAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

        self.loadDataForTableView()
        self.loadDataForMapView()
        self.setupToolbar()
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! FUIObjectTableViewCell
        
        let task = self.tasks[indexPath.row]
        cell.headlineText = task.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

// MARK: - MKMapViewDelegate
extension TaskListViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    
}

// MARK: - CLLocationManagerDelegate
extension TaskListViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
}

// MARK: - Private methods
extension TaskListViewController {
    
    private func loadDataForTableView() {
        var data = DummyData(title: "fakeData", coordinate: CLLocationCoordinate2D(latitude: 41.395815, longitude: 2.173050))
        self.tasks.append(data)
    }
    
    private func loadDataForMapView() {
        let annotations = TaskAnnotation.wrap(self.tasks)
        if annotations.count > 0 {
            self.mapView.addAnnotations(annotations)
            self.mapView.showAnnotations(annotations, animated: true)
        }
    }
    
    private func setupToolbar() {
        self.toolbar = FUIMapToolbar(mapView: self.mapView)
        self.toolbar.backgroundColorScheme = .lightBackground
        
        let locationButton = FUIMapToolbarUserLocationButton(mapView: self.mapView)
        
        let zoomExtentsButton = FUIMapToolbarZoomExtentButton(mapView: self.mapView)
        
        self.toolbar.items = [locationButton, zoomExtentsButton]
        
        self.view.insertSubview(self.toolbar, aboveSubview: self.mapView)
        self.toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.toolbar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 15.0).isActive = true
        self.toolbar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15.0).isActive = true
    }
    
}

class TaskAnnotation: MKPointAnnotation {
    
    // MARK: Properties
    
    let task: DummyData
    
    // MARK: Init
    
    init(_ task: DummyData) {
        self.task = task
        super.init()
        
        self.title = task.title
        self.coordinate = task.coordinate
    }
    
    static func wrap(_ tasks: [DummyData]) -> [TaskAnnotation] {
        var retVal = [TaskAnnotation]()
        for task in tasks {
            retVal.append(TaskAnnotation(task))
        }
        return retVal
    }
    
}

class TaskAnnotationView: FUIMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            self.displayPriority = .defaultLow
        }
    }
    
}



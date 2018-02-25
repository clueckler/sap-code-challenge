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
    
    var tasks = [Task]()
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
        
        self.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        self.mapView.register(TaskAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

        self.loadDataForTableView()
        self.setupToolbar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! IndexPath
        let order = tasks[indexPath.row]
        let sOviewControler = segue.destination as! TaskDetailViewController
        
        sOviewControler.delegate = self
        sOviewControler.initialize(oDataModel: oDataModel!)
        sOviewControler.load(task: order)
    }
    
}

extension TaskListViewController: TaskViewControllerDelegate {
    func didCloseTask() {
        self.navigationController?.popToRootViewController(animated: true)
        loadDataForTableView()
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
        cell.headlineText = task.taskID
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "taskDetailSegue", sender: indexPath)
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
        oDataModel.loadOpenTasks { [weak self] (tasks, error) in
            self?.tasks = tasks
            self?.tableView.reloadData()
            
            let annotations = TaskAnnotation.wrap(tasks)
            self?.mapView.removeAnnotations(self?.mapView.annotations ?? [])

            if annotations.count > 0 {
                self?.mapView.addAnnotations(annotations)
                self?.mapView.showAnnotations(annotations, animated: true)
            }
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
    
    let task: Task
    
    // MARK: Init
    
    init(_ task: Task) {
        self.task = task
        super.init()
        
        self.title = task.taskID
        self.coordinate = task.coordinates
    }
    
    static func wrap(_ tasks: [Task]) -> [TaskAnnotation] {
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



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
    private let refreshControl = UIRefreshControl()

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
        
        self.title = "Tasks"
        
        self.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        self.mapView.register(TaskAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

        self.loadDataForTableView()
        self.setupToolbar()
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(loadDataForTableView), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.locationManager?.requestWhenInUseAuthorization()
        self.locationManager?.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.locationManager?.stopUpdatingLocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let order = sender as! Task
        let sOviewControler = segue.destination as! TaskDetailViewController
        
        sOviewControler.delegate = self
        sOviewControler.initialize(oDataModel: oDataModel!)
        sOviewControler.load(task: order)
    }
    
}

extension TaskListViewController: TaskDetailViewControllerDelegate {
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
        
        self.selectMapAnnotation(tasks[indexPath.row])
    }
    
}

// MARK: - MKMapViewDelegate
extension TaskListViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let view = view as? TaskAnnotationView else {
            return
        }
        
        guard let annotation = view.annotation as? TaskAnnotation else {
            return
        }
        
        // Deselect annotation to have a clean map selection state
        //mapView.deselectAnnotation(annotation, animated: false)
        
        // Calculate popover position
        let sourceView = self.view
        let point = mapView.convert(annotation.coordinate, toPointTo: sourceView)
        let selectedScale: CGFloat = 2.5
        let sourceRect = CGRect(x: point.x - ((view.bounds.size.width * selectedScale) / 2.0),
                                y: point.y - (view.bounds.size.height * selectedScale) - 5.0,
                                width: (view.bounds.size.width * selectedScale),
                                height: (view.bounds.size.height * selectedScale) + 10.0)
        
        // Create and display popover
        let viewController = UIViewController()
        viewController.modalPresentationStyle = .popover
        viewController.preferredContentSize = TaskCalloutView.preferredSize
        
        let calloutView = TaskCalloutView(frame: CGRect(origin: CGPoint.zero, size: TaskCalloutView.preferredSize))
        calloutView.titleText = annotation.task.taskID
        calloutView.subtitleText = annotation.task.lifeCycleStatusName
        calloutView.route = nil
        viewController.view.addSubview(calloutView)
        
        self.requestTravelTime(annotation.coordinate) { (route) in
            calloutView.route = route
        }
        
        calloutView.showCustomer = { _ in
            self.dismiss(animated: false)
            self.mapView.deselectAnnotation(annotation, animated: false)
            
            self.performSegue(withIdentifier: "taskDetailSegue", sender: annotation.task)
        }
        
        calloutView.getDirection = { _ in
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: annotation.coordinate, addressDictionary: nil))
            mapItem.name = annotation.task.taskID
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
        }
        
        self.present(viewController, animated: true)
        
        if let popover = viewController.popoverPresentationController {
            popover.permittedArrowDirections = [.down, .up]
            popover.sourceView = sourceView
            popover.sourceRect = sourceRect
            popover.delegate = self
        }
    }
    
}

// MARK: - UIPopoverPresentationControllerDelegate
extension TaskListViewController: UIPopoverPresentationControllerDelegate {
    
    // This method is called when the user clicks outside of the popoverViewController
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        for annotation in self.mapView.selectedAnnotations {
            self.mapView.deselectAnnotation(annotation, animated: true)
        }
        return true
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
    
    @objc private func loadDataForTableView() {
        oDataModel.loadOpenTasks { [weak self] (tasks, error) in
            self?.refreshControl.endRefreshing()
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
    
    private func requestTravelTime(_ coordinate: CLLocationCoordinate2D, completion: @escaping ((MKRoute) -> Void)) {
        let request = MKDirectionsRequest()
        request.source = MKMapItem.forCurrentLocation()
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        
        let directions = MKDirections(request: request)
        directions.calculate { (response, _) in
            if let route = response?.routes.first {
                completion(route)
            }
        }
    }
    
    private func selectMapAnnotation(_ task: Task, animated: Bool = true) {
        let annotation = self.mapView.annotations.first { (mapAnnotation) -> Bool in
            guard let annotation = mapAnnotation as? TaskAnnotation else {
                return false
            }
            return annotation.task.taskID == task.taskID
        }
        
        if let annotation = annotation {
            self.mapView.selectAnnotation(annotation, animated: animated)
            
            // Check if the annotation is displayed in the visible rect, otherwise zoom to the selected annotation
            let annotations = self.mapView.annotations(in: self.mapView.visibleMapRect)
            if !annotations.contains(annotation as! AnyHashable) {
                self.mapView.showAnnotations([annotation], animated: true)
            }
        }
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
            self.glyphImage = FUIIconLibrary.map.marker.job.withRenderingMode(.alwaysTemplate)
            
            if let anno = newValue as? TaskAnnotation {
                switch arc4random_uniform(3) {
                case 0:
                    self.priorityIcon =  FUIIconLibrary.map.marker.veryHighPriority
                case 1:
                    self.priorityIcon =  FUIIconLibrary.map.marker.mediumPriority
                default:
                    self.priorityIcon = nil
                }
            }
        }
    }
    
}



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
    
    var tasks = [DummyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        self.mapView.register(TaskAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

        self.loadDataForTableView()
        self.loadDataForMapView()
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

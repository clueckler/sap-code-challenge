//
//  TaskCalloutView.swift
//  EMSShowcase
//
//  Created by Christoph Lückler on 02.02.18.
//  Copyright © 2018 Netconomy Software & Consulting GmbH. All rights reserved.
//

import UIKit
import MapKit
import SAPFiori

class TaskCalloutView: UIView {

    // MARK: View elements
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var routeButton: UIButton!
    
    // MARK: Properties
    
    private var contentView: UIView!
    static let preferredSize = CGSize(width: 320.0, height: 140.0)
    
    var titleText: String? {
        set {
            self.titleLabel.text = newValue
        }
        get {
            return self.titleLabel.text
        }
    }
    
    var subtitleText: String? {
        set {
            self.subtitleLabel.text = newValue
        }
        get {
            return self.subtitleLabel.text
        }
    }
    
    var route: MKRoute? {
        willSet {
            self.routeButton.setAttributedTitle(self.prettyRouteString(newValue, textColor: .white),
                                                for: .normal)
            
            self.routeButton.setAttributedTitle(self.prettyRouteString(newValue, textColor: UIColor.preferredFioriColor(forStyle: .tintColorTapState)),
                                                for: .highlighted)
        }
    }
    
    var showCustomer: ((UIButton) -> Void)?
    var callCustomer: ((UIButton) -> Void)?
    var getDirection: ((UIButton) -> Void)?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }

    private func xibSetup() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TaskCalloutView", bundle: bundle)
        
        self.contentView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        self.contentView.frame = bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(self.contentView)
    }
    
}

// MARK: - View life cylce
extension TaskCalloutView {
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if self.superview != nil {
            self.contentView.backgroundColor = self.backgroundColor
            
            let routeLayer = self.routeButton.layer
            routeLayer.cornerRadius = 5.0
            routeLayer.masksToBounds = true
            
            self.routeButton.backgroundColor = UIColor.preferredFioriColor(forStyle: .tintColor)
            self.routeButton.titleLabel?.numberOfLines = 0
        }
    }
    
}

// MARK: - Button pressed
extension TaskCalloutView {
    
    @IBAction func routeButtonPressed(_ sender: UIButton) {
        self.getDirection?(sender)
    }
    
    @IBAction func phoneButtonPressed(_ sender: UIButton) {
        self.callCustomer?(sender)
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        self.showCustomer?(sender)
    }
    
}

// MARK: - Private methods
extension TaskCalloutView {
    
    private func prettyRouteString(_ route: MKRoute?, textColor: UIColor) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 2.0
        
        let attributedString = NSMutableAttributedString(string: "Directions",
                                                         attributes: [.font: UIFont.systemFont(ofSize: 13.0, weight: .semibold),
                                                                      .foregroundColor: textColor,
                                                                      .paragraphStyle: paragraphStyle])
        
        if let routeInfo = route?.prettyRouteInfo() {
            let attributedRouteString = NSMutableAttributedString(string: routeInfo,
                                                                  attributes: [.font: UIFont.systemFont(ofSize: 13.0, weight: .regular),
                                                                               .foregroundColor: textColor,
                                                                               .paragraphStyle: paragraphStyle])
            
            attributedString.append(NSAttributedString(string: "\n"))
            attributedString.append(attributedRouteString)
        }
        
        return attributedString
    }
    
}

extension MKRoute {
    
    func prettyRouteInfo() -> String {
        let hours = Int(self.expectedTravelTime) / 3600
        let minutes = (Int(self.expectedTravelTime) / 60) % 60
        
        var prettyDuration = ""
        if hours > 0 && minutes > 0 {
            prettyDuration = "\(hours)h \(minutes)min" // TODO: I18N
        } else if hours > 0 {
            prettyDuration = "\(hours) h" // TODO: I18N
        } else {
            prettyDuration = "\(minutes) min" // TODO: I18N
        }
        
        switch self.transportType {
        case .automobile:
            return "\(prettyDuration) drive" // TODO: I18N
        case .walking:
            return "\(prettyDuration) walking" // TODO: I18N
        case .transit:
            return "\(prettyDuration) transit" // TODO: I18N
        default:
            return prettyDuration
        }
    }
    
}

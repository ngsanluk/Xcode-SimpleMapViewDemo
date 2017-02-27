//
//  ViewController.swift
//  MapViewDemo
//
//  Created by Sunny NG on 27/2/2017.
//  Copyright © 2017 Sunny NG. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeMapType(_ sender: Any) {
        if self.mapView.mapType == MKMapType.standard {
            self.mapView.mapType = MKMapType.satellite
        }
        else if self.mapView.mapType == MKMapType.satellite {
            self.mapView.mapType = MKMapType.hybrid
        }
        else {
            self.mapView.mapType = MKMapType.standard
        }
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        let userLocation = mapView.userLocation
        // Defining a smaller targeted span means zooming in
        let newSpan = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta * 0.5,
                                       longitudeDelta: mapView.region.span.longitudeDelta * 0.5)
        let newRegion = MKCoordinateRegion(
            center: userLocation.location!.coordinate,
            span: newSpan
        )
        mapView.setRegion(newRegion, animated: true)
    }
    
    
    @IBAction func zoomOut(_ sender: Any) {
        let userLocation = mapView.userLocation
        // Defining a bigger targeted span means zooming out
        let newSpan = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta * 2,
                                       longitudeDelta: mapView.region.span.longitudeDelta * 2)
        let newRegion = MKCoordinateRegion(
            center: userLocation.location!.coordinate,
            span: newSpan
        )
        mapView.setRegion(newRegion, animated: true)
    
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        self.mapView.centerCoordinate = userLocation.location!.coordinate
    }
    
    
}


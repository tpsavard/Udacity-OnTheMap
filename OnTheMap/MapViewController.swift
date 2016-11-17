//
//  MapViewController.swift
//  OnTheMap
//
//  Created by Savard, Tim on 11/2/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, Refreshable {
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK:- Map View Delegate Methods
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pin"
        
        var annotationView: MKAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        if let annotationView = annotationView {
            annotationView.annotation = annotation
        } else {
            let newAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            newAnnotationView.canShowCallout = true
            newAnnotationView.rightCalloutAccessoryView = UIButton.init(type: .detailDisclosure)
            annotationView = newAnnotationView
        }
        
        return annotationView
    }

    // MARK:- Other Methods

    func refresh() {
        // Clear out the old pins
        mapView.removeAnnotations(mapView.annotations)
        
        // Add the new pins
        for instance: StudentInformation in Session.data.studentInformation {
            // Prep the data
            let studentName: String = instance.firstName + " " + instance.lastName
            guard let studentURL: String = instance.url?.absoluteString else {
                continue
            }
            
            // Create the annotation
            let annotation: MKPointAnnotation = MKPointAnnotation()
            annotation.title = studentName
            annotation.subtitle = studentURL
            annotation.coordinate = CLLocationCoordinate2D(latitude: instance.latitude, longitude: instance.longitude)
            
            // Add the annotation
            mapView.addAnnotation(annotation)
        }
    }
    
}

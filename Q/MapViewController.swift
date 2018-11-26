//
//  MapViewController.swift
//  Q
//
//  Created by Jaeson Booker on 11/25/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation

//final class MapAnnotation: NSObject, MKAnnotation {
//    var coordinate: CLLocationCoordinate2D
//    var title: String?
//    var subtitle: String?
//
//    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
//        self.coordinate = coordinate
//        self.title = title
//        self.subtitle = subtitle
//        super.init()
//    }
//}

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var data = [Restaurant]()
    var r = Restaurant()
    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var coordinate = CLLocationCoordinate2D()
    let regionInMeters: Double = 10000.0
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        guard let newCoordinates = locationManager.location?.coordinate else { return }
        let region = MKCoordinateRegion(center: newCoordinates, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        coordinate = newCoordinates
        let annotation1 = MKPointAnnotation()
        annotation1.title = "Bulba Fett Tea"
        annotation1.subtitle = "Everyone's favourite tea inspired by everyone's favourite Star Trek character"
        annotation1.coordinate = coordinate
        mapView.addAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.title = "Kale"
        annotation2.subtitle = "Kale French Fries!"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.780664, longitude: -122.416183)
        mapView.addAnnotation(annotation2)
        
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
//        let venueCoordinate = CLLocationCoordinate2D(latitude: 37.780664, longitude: -122.416183)
//        let venueAnnotation = MapAnnotation(coordinate: venueCoordinate, title: "Tenderloin", subtitle: "Eaten Them Tender Loins TM")
//        mapView.addAnnotation(venueAnnotation)
//        checkLocationServices()
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return pin
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let rView = view.annotation
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "restaurantDetail") as! restaurantDetailsTableViewController
        detailVC.rtitle = ((rView?.title!)!)
        detailVC.rsubtitle = ((rView?.subtitle)!)!
        detailVC.rlatitude = (rView?.coordinate.latitude)!
        detailVC.rlongitude = (rView?.coordinate.longitude)!
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
//    func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//    func centerViewOnUserLocation() {
//        if let location = locationManager.location?.coordinate {
//            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//            mapView.setRegion(region, animated: true)
//        }
//    }
//    func checkLocationServices() {
//        if CLLocationManager.locationServicesEnabled() {
//            setupLocationManager()
//            checkLocationAuthorization()
//        } else {
//            //
//        }
//    }
//    func checkLocationAuthorization() {
//        switch CLLocationManager.authorizationStatus() {
//        case .authorizedWhenInUse:
//            mapView.showsUserLocation = true
//            centerViewOnUserLocation()
//            locationManager.startUpdatingLocation()
//            break
//        case .denied:
//            break
//        case .notDetermined:
//            //ask permision
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            break
//        case .authorizedAlways:
//            break
//        default:
//            break
//        }
//    }
//    func mapView(_ mapView: MKMapView,annotationView view: MKAnnotationView,calloutAccessoryControlTapped control: UIControl){
//
//        r = view.annotation as! Restaurant //get the annotation, which is a parameter
//
//        performSegue(withIdentifier: "restaurantDetails", sender: self) //perform manual segue
//
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            // Get the new view controller using segue.destinationViewController.
//            // Pass the selected object to the new view controller.
//            if segue.identifier=="restaurantDetails" {
//                let dest = segue.destination as! restaurantDetailsTableViewController
//                dest.r = r
//
//        }
//
//    }
//}
//extension MapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//        mapView.setRegion(region, animated: true)
//    }
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        checkLocationAuthorization()
//    }
}

//    var data = [Restaurant]()
//    var locManager: CLLocationManager!
//    var r = Restaurant()
//    let r1 = Restaurant()
//    let r2 = Restaurant()
//    let r3 = Restaurant()
//    let locationManager = CLLocationManager()
//    let regionInMeters: Double = 100.0
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        r1.name = "Cooked Tender Loins"
//        r1.restaurantDescription = "Get em' hot n' tender!"
//        r2.name = "SF Kale"
//        r2.restaurantDescription = "Kale. Kale. Kale."
//        r3.name = "Bulba Fett Tea"
//        r3.restaurantDescription = "Tea inspired by everyone's favourite Star Trek character"
//
//        data.append(r1)
//        data.append(r2)
//        data.append(r3)
//        locManager = CLLocationManager()
//        locManager.delegate = self
//        locManager.requestWhenInUseAuthorization()
//
//        mapView.delegate = self
//        mapView.addAnnotations(data)
//        mapView.showAnnotations(mapView.annotations, animated: true)
//        //radius time
//        let radius=max(10.0,1000.0*mapView.region.span.latitudeDelta,1000.0*mapView.region.span.longitudeDelta)
//
//        for r in data {
//            showCircle(coordinate: r.coordinate, radius: radius)
//        }
 //   }
//    func showCircle(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance) {
//
//        let circle = MKCircle.init(center: coordinate, radius: radius)
//
//        mapView.addOverlay(circle)
//
//    }
//    func mapView(_ mapView: MKMapView,regionDidChangeAnimated animated: Bool){
//
//        var overlays:[MKOverlay]?
//        let radius=max(10,1000*mapView.region.span.latitudeDelta,1000*mapView.region.span.longitudeDelta)
//
//        overlays=mapView.overlays
//
//        if overlays?.count==0 {
//            for r in data {
//                showCircle(coordinate: r.coordinate, radius: radius)
//            }
//            return;
//        }
//        mapView.removeOverlays(overlays!)
//
//
//        for ov in overlays!
//        {
//            showCircle(coordinate: ov.coordinate, radius:radius)
//
//        }
//
//    }
//    func mapView(_ mapView: MKMapView,rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//
//
//        let circleRenderer = MKCircleRenderer.init(overlay: overlay)
//        circleRenderer.fillColor = UIColor.purple
//        circleRenderer.alpha = 0.5
//
//
//        return circleRenderer
//
//    }
//
//    func mapView(_ mapView: MKMapView,didUpdate userLocation: MKUserLocation)
//    {
//        mapView.region.center=userLocation.coordinate
//        mapView.showAnnotations(mapView.annotations, animated: true)
//
//
//    }
//    func mapView(_ mapView: MKMapView,viewFor annotation: MKAnnotation) -> MKAnnotationView?
//    {
//
//
//        var pinView=mapView.dequeueReusableAnnotationView(withIdentifier:"restaurant") as? MKPinAnnotationView
//
//        if annotation.isEqual(mapView.userLocation) {
//            return nil
//        }
//
//
//        if pinView==nil {
//            pinView=MKPinAnnotationView.init(annotation: annotation, reuseIdentifier: "restaurant")
//
//            pinView!.canShowCallout=true
//            let r=annotation as! Restaurant
//
//
//            if(r.favourite==true) {
//                pinView!.pinTintColor=UIColor.green
//            }
//            else {
//                pinView!.pinTintColor=UIColor.blue
//            }
//
//            //add a button on the callout
//            let btn=UIButton(type:.infoDark) as UIButton
//
//            pinView!.rightCalloutAccessoryView = btn
//
//
//            //now add an image on the callout
//            let imageview = UIImageView.init(frame:CGRect(origin:CGPoint(x:0,y:0),size:CGSize(width:30,height:30)))
//
//            imageview.image = UIImage(named:r.restaurantImage)
//
//            pinView!.leftCalloutAccessoryView=imageview
//
//
//        }
//        else {
//
//            pinView!.annotation = annotation;
//        }
//
//        return pinView;
//
//    }
////    func mapView(_ mapView: MKMapView,annotationView view: MKAnnotationView,calloutAccessoryControlTapped control: UIControl){
////
////        var r = view.annotation as! Restaurant  //get the annotation, which is a parameter
////
////        performSegue(withIdentifier: "restaurantDetails", sender: self) //perform manual segue
////
////    }
//    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        switch status {
//        case .notDetermined:
//            // If status has not yet been determied, ask for authorization
//            manager.requestWhenInUseAuthorization()
//
//        case .authorizedWhenInUse:
//            // If authorized when in use
//            manager.startUpdatingLocation()
//
//        case .authorizedAlways:
//            // If always authorized
//            manager.startUpdatingLocation()
//
//        case .restricted:
//            // If restricted by e.g. parental controls. User can't enable Location Services
//            break
//        case .denied:
//            // If user denied your app access to Location Services, but can grant access from Settings.app
//            break
//        default:
//            break
//
//        }
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        // Get the new view controller using segue.destinationViewController.
////        // Pass the selected object to the new view controller.
////        if segue.identifier=="restaurantDetails" {
////            //let dest = segue.destination as! restaurantDetailsTableViewController
////            //dest.r = r
////
////        }
////
////    }
//
//}

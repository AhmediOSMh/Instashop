//
//  GPSViewController.swift
//  InstaShop
//
//  Created by Ahmed Mh on 20/10/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import GooglePlacePicker

class GPSViewController: BaseController, GMSMapViewDelegate ,CLLocationManagerDelegate{

    @IBOutlet weak var address: TextField!
    @IBOutlet weak var gpsLbl: Label!
    @IBOutlet weak var GpsBtn: Button!
    @IBOutlet weak var Viewmap: UIView!
    var locationManager = CLLocationManager()
    var mapView:GMSMapView?
    var  placeAddress = CLLocationCoordinate2D()
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        address.layer.borderColor = UIColor.lightGray.cgColor
        address.layer.borderWidth = 1.0
        super.viewDidLoad()
        
        mapView = GMSMapView.map(withFrame: self.Viewmap.frame, camera: GMSCameraPosition.camera(withLatitude: 51.050657, longitude: 10.649514, zoom: 5.5))
        mapView?.center = self.Viewmap.center
        self.mapView?.isMyLocationEnabled = true
        mapView?.settings.myLocationButton = true
        //Location Manager code to fetch current location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        self.Viewmap.addSubview(mapView!)
        self.address.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        self.present(acController, animated: true, completion: nil)
    }
}


extension GPSViewController: GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress ?? "null")")
        self.address.text = place.formattedAddress
        print("Place attributions: \(String(describing: place.attributions))")
        
        self.dismiss(animated: true, completion: nil)
        var position = place
        placeAddress = place.coordinate
        var marker = GMSMarker(position: position.coordinate)
        marker.title = place.name
        marker.map = mapView
        let cameraposition = GMSCameraPosition.camera(withLatitude: position.coordinate.latitude,
                                              longitude:  position.coordinate.longitude,
                                              zoom: 6)
        mapView?.camera = cameraposition
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
                print("Error: \(error)")
        self.dismiss(animated: true, completion: nil)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func RetryAction(_ sender: Any) {
        let newViewController = AllStoresViewController(nibName: "AllStoresViewController", bundle: nil)
        let myDict = [ "longitude": placeAddress.longitude, "latitude": placeAddress.latitude]
       //NotificationCenter.default.post(name: .address, object: nil, userInfo: myDict)
        
        let userDefaults = Foundation.UserDefaults.standard
        userDefaults.set(myDict, forKey: "myDict")
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension Notification.Name {
    static let address = Notification.Name("address")
}

//
//  ViewController.swift
//  MapKitTask
//
//  Created by Alex Lee on 11/05/2019.
//  Copyright © 2019 Alex Lee. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    var squarePolyline: MKOverlay?
    var destinationPolyline: MKOverlay?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        setRegion(coordinate: CLLocationCoordinate2D(latitude: 37.566308, longitude: 126.977948))
        //        mapView.showsUserLocation = true
    }
    
    func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func moveToAnnotation(annotationTitle: String) {
        guard !mapView.annotations.isEmpty else {return}
        
        let annotation = mapView.annotations.filter{ $0.title == annotationTitle }
        
//        setRegion(coordinate: annotation.first!.coordinate)
        mapView.setRegion(MKCoordinateRegion(
            center: annotation.first!.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)), animated: true)
    }
    
    @IBAction func adressTFEditingDidBegin(_ sender: Any) {
        addressTF.becomeFirstResponder()
    }
    @IBAction func addressTFDidEndonExit(_ sender: UITextField) {
        addressTF.resignFirstResponder()
        
        print(sender.text)
        setAnnotation(inputAddress: sender.text ?? "")
    }
    
    
    
    func setAnnotation(inputAddress : String) {
        guard inputAddress != "" else { return }
        
        var checkError = false
        var coordinate =  CLLocationCoordinate2D(latitude: 0, longitude: 0)
        
        let geocoder = CLGeocoder()
        
        let addr = inputAddress
        geocoder.geocodeAddressString(addr, completionHandler: { (placeMark, error) in      // 다시 좌표계로 변환해서 출력
            
            if error != nil {
                checkError = true
                return print("●●●●●● Error 발생 : ", error!.localizedDescription)
            }
            
            print("geocodeAddressString 실행")
            print("●●●●●● 좌표계 : ", placeMark)
            print("●●●●●● 위도, 경도 : ", placeMark?.first?.region?.identifier)
            print("●●●●●● 위도, 경도 : ", placeMark?.first?.location?.coordinate)
            
            coordinate = placeMark!.first!.location!.coordinate
            
            let annotation = MKPointAnnotation()
            annotation.title = "\(self.mapView.annotations.count + 1)번째 행선지"
            annotation.subtitle = inputAddress
            annotation.coordinate = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
            self.mapView.addAnnotation(annotation)
            
            self.moveToAnnotation(annotationTitle: annotation.title ?? "")
            
            if self.squarePolyline != nil {
                self.mapView.removeOverlay(self.squarePolyline!)
            }
            self.drawSquareLine(centerCoordinate: coordinate)
            self.drawDestinationsLine(destinationCoordinate: coordinate)
        })
        
        guard checkError == false else {
            print("잘못된 주소입니다")
            return
        }
        
//        let annotation = MKPointAnnotation()        // [Question??] 여기 쓰면 왜 geoAdressString 의 좌표값을 받아올수가 없지???
//        annotation.title = "\(self.mapView.annotations.count + 1)번째 행선지"
//        annotation.subtitle = inputAddress
//        annotation.coordinate = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
//        self.mapView.addAnnotation(annotation)
//
//        self.moveToAnnotation(annotationTitle: annotation.title ?? "")
    }
    
    func drawSquareLine(centerCoordinate: CLLocationCoordinate2D) {
        let center = centerCoordinate
        var point1 = center; point1.longitude += 0.01; point1.latitude -= 0.005
        var point2 = center; point2.longitude += 0.01; point2.latitude += 0.005
        var point3 = center; point3.longitude -= 0.01; point3.latitude -= 0.005
        var point4 = center; point4.longitude -= 0.01; point4.latitude += 0.005
        
        let points: [CLLocationCoordinate2D] = [point1, point2, point4, point3, point1]
        
        squarePolyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(squarePolyline!)
    }
    
    var priorDestinationCoordinate: CLLocationCoordinate2D?
    func drawDestinationsLine(destinationCoordinate: CLLocationCoordinate2D) {
        
        var destinationsPoint: [CLLocationCoordinate2D] = []
        
        if let _ = priorDestinationCoordinate {
            destinationsPoint.append(priorDestinationCoordinate!)
            print("●●●●●● : 이전 목적지 좌표 추가됨")
        }
        destinationsPoint.append(destinationCoordinate)
        print("●●●●●● : 현재 목적지 좌표 추가됨")
        
        destinationPolyline = MKPolyline(coordinates: destinationsPoint, count: destinationsPoint.count)
        mapView.addOverlay(destinationPolyline!)
        
        priorDestinationCoordinate = destinationCoordinate
    }
    
    
   
    
}


extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        print("●●●●●● mapView : ", mapView)
        print("●●●●●● overlay : ", overlay)
        
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            if overlay.isEqual(destinationPolyline) {
                renderer.strokeColor = .cyan
            } else {
                renderer.strokeColor = .red
            }
            renderer.lineWidth = 1
            return renderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}

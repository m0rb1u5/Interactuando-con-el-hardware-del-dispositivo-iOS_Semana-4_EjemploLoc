//
//  ViewController.swift
//  Interactuando-con-el-hardware-del-dispositivo-iOS_Semana-4_EjemploLoc
//
//  Created by Juan Carlos Carbajal Ipenza on 2/06/17.
//  Copyright © 2017 Juan Carlos Carbajal Ipenza. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var latitudEtiqueta: UILabel!
    @IBOutlet weak var longitudEtiqueta: UILabel!
    @IBOutlet weak var exHorEtiqueta: UILabel!
    @IBOutlet weak var nteMagEtiqueta: UILabel!
    @IBOutlet weak var nteGeoEtiqueta: UILabel!

    private let manejador = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.manejador.delegate = self
        self.manejador.desiredAccuracy = kCLLocationAccuracyBest
        self.manejador.requestWhenInUseAuthorization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.manejador.startUpdatingLocation()
            self.manejador.startUpdatingHeading()
        }
        else {
            self.manejador.stopUpdatingLocation()
            self.manejador.stopUpdatingHeading()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.latitudEtiqueta.text = "\(manager.location!.coordinate.latitude)"
        self.longitudEtiqueta.text = "\(manager.location!.coordinate.longitude)"
        self.exHorEtiqueta.text = "\(manager.location!.horizontalAccuracy)"
    }
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.nteMagEtiqueta.text = "\(newHeading.magneticHeading)"
        self.nteGeoEtiqueta.text = "\(newHeading.trueHeading)"
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alerta = UIAlertController(title: "ERROR", message: "error \(error.localizedDescription)", preferredStyle: .alert)
        let accionOK = UIAlertAction(title: "OK", style: .default, handler: {
            accion in
            //.
        })
        alerta.addAction(accionOK)
        self.present(alerta, animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-03.
//

import CoreBluetooth
import UIKit

class HomeVC: UIViewController{

    @IBOutlet weak var startScanBtn: StartScanButton!
    let bluetoothScanner = BluetoothScanner()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CURRENT STATE = \(bluetoothScanner.centralManagerDidUpdateState(bluetoothScanner.manager))")
    }
    

    @IBAction func startScanBtnAction(_ sender: Any) {
        print("*********\(Global.currentDeviceState)")
        if(Global.currentDeviceState == 3){
            //Bluetooth authorization has been denied
            alertActionBasic(viewController: self, title: "Bluetooth Disabled", message: "You have declined this app's usage of the bluetooth services. As a result you will not be able to use the bluetooth scanning feature to find a scooter near you. You will be able to change this permission within your iPhone settings. Settings -> BluetoothFinder -> Bluetooth ->allow", completionHandler: {_ in
                return
            })
        } else if(Global.currentDeviceState == 4){
            //Bluetooth has been powered off
            alertActionBasic(viewController: self, title: "Warning!", message: "Your bluetooth may not be turend on. Please verify you have turned on your bluetooth before starting a search.", completionHandler: {finished in
                if finished == true {
                    return
                }
            })
        } else if(Global.currentDeviceState == 2){
            //Bluetooth is not supported
            alertActionBasic(viewController: self, title: "Warning!", message: "Your bluetooth is not supported by this application. Consider updating to the latest iOS version on your iPhone.", completionHandler: {finished in
                if finished == true {
                    return
                }
            })
        }else if(Global.currentDeviceState == 1){
            //Bluetooth is resetting
            alertActionBasic(viewController: self, title: "Warning!", message: "Your bluetooth is currently restarting. Please try again in a few moments", completionHandler: {finished in
                if finished == true {
                    return
                }
            })
        }else {
            //Bluetooth is ready to go 
            self.performSegue(withIdentifier: "startScanSegue", sender: self)
        }
        
    }
    
}


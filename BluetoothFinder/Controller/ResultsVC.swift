//
//  ResultsVC.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-05.
//

import UIKit
import CoreBluetooth

class CustomTableViewCell: UITableViewCell{
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var state: UILabel!
}

class ResultsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var noDevicesFoundView: UIView!
    @IBOutlet weak var navigationBackBtn: UINavigationItem!
    @IBOutlet weak var titleLabel: TitleLabel!
    @IBOutlet weak var tableView: UITableView!
    
    let bluetoothScanner = BluetoothScanner()
    var timer = Timer()
    var deviceNameSelected: String?
    var deviceIDSelected: String?
    var deviceStateSelected: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.noDevicesFoundView.isHidden = true
        print("CURRENT DEVICE STATE - raw value = \(bluetoothScanner.manager.state.rawValue)")
        startTimer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    ///This function will stop the bluetoothScanner and stop the search gif
    ///It will also renenable touch of all application UI. tab bar items and all of ResultsVC
    ///The functionality is to re-enable all user touch interface when the search stops
    @objc func stopScanningForScooters(){
        print("scan stopped")
        bluetoothScanner.manager.stopScan()
        CustomLoader.instance.hideLoaderView()
    
        storeDiscoveredBluetoothDevices()///this is a poor function name, this function is taking in all the data and appending it to a proper class object
        self.tabBarController?.tabBar.isUserInteractionEnabled = true
        self.navigationItem.hidesBackButton = false
        for tabItem in self.tabBarController!.tabBar.items! {
            tabItem.isEnabled = true
        }
        self.view.isUserInteractionEnabled = true
        self.tableView.reloadData()
    }
    
    ///The idea being here that after 10 seconds the search will STOP
    ///Restarting the search will start this timer.
    ///After 10 seconds the scan will stop
    ///The functionality will disable all user touch interface while the search is running
    func startTimer(){
        CustomLoader.instance.showLoaderView()
        for tabItem in self.tabBarController!.tabBar.items! {
            tabItem.isEnabled = false
        }
        bluetoothScanner.discoveredDevices.removeAll()
        self.tableView.reloadData()
        bluetoothScanner.manager.scanForPeripherals(withServices:nil)
        self.view.isUserInteractionEnabled = false
        self.navigationItem.hidesBackButton = true
        self.timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(stopScanningForScooters), userInfo: nil, repeats: false)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bluetoothScanner.discoveredDevices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        let data = DiscoveredDevices.devicesdictionary[indexPath.row]
    
        cell?.name.text = data["name"] as? String
        cell?.id.text = data["id"] as? String
        cell?.state.text = data["state"] as? String
        cell?.iconImg.image = UIImage(named: "apollo.png")

        return cell ?? UITableViewCell()
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = DiscoveredDevices.devicesdictionary[indexPath.row]
        print("SELECTED -> \(selectedItem.keys)")
        self.deviceIDSelected = selectedItem["id"] as? String
        self.deviceNameSelected = selectedItem["name"] as? String
        self.deviceStateSelected = selectedItem["state"] as? String
        self.performSegue(withIdentifier: "viewDevice", sender: self)
    }
    
    @IBAction func scanAgainBtn(_ sender: Any) {
        startTimer()
    }
    
    func storeDiscoveredBluetoothDevices(){
            
    //    CBManagerStateUnknown: 0
    //    CBManagerStateResetting: 1
    //    CBManagerStateUnsupported: 2
    //    CBManagerStateUnauthorized: 3
    //    CBManagerStatePoweredOff: 4
    //    CBManagerStatePoweredOn: 5
    //    CBPeripheralStateDisconnected: 0
    //    CBPeripheralStateConnecting: 1
    //    CBPeripheralStateConnected: 2
    //    CBPeripheralStateDisconnecting: 3
        let discoveredDevicesArray = Array(bluetoothScanner.discoveredDevices)
        if(discoveredDevicesArray.count <= 0){
            self.noDevicesFoundView.isHidden = false
        } else {
            self.noDevicesFoundView.isHidden = true
        }

        for peripheral in discoveredDevicesArray {
            var state = ""
            switch(peripheral.state.rawValue){
                case 0 :
                    state = "Unknown"
                case 1:
                    state = "Resetting"
                case 2:
                    state = "Unsupported"
                case 3:
                    state = "Unauthorized"
                case 4:
                    state = "Powered Off"
                case 5:
                    state = "Power On"
                default :
                    state = "N/A"
            }
            let peripheralData = ["name": peripheral.name ?? "N/A", "id": peripheral.identifier.uuidString , "state": state] as [String : Any]
            
            DiscoveredDevices.devicesdictionary.append(peripheralData)
        }
        
        print("NEW DICT = \(DiscoveredDevices.devicesdictionary)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewDevice" {
            if let destination = segue.destination as? DeviceInformationVC {
                destination.stateData = self.deviceStateSelected ?? "N/A"
                destination.idData = self.deviceIDSelected ?? "N/A"
                destination.nameData = self.deviceNameSelected ?? "N/A"
                return
            }
        }
    }
    
}

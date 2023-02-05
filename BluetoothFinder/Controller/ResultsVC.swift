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

    
    @IBOutlet weak var titleLabel: TitleLabel!
    
    @IBOutlet weak var tableView: UITableView!
    let bluetoothScanner = BluetoothScanner()
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        startTimer()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bluetoothScanner.manager.scanForPeripherals(withServices:nil)
        CustomLoader.instance.showLoaderView()
    }
    
    ///This function will stop the bluetoothScanner and stop the search gif
    @objc func stopScanningForScooters(){
        print("scan stopped")
        bluetoothScanner.manager.stopScan()
        CustomLoader.instance.hideLoaderView()
        appendAllFoundBluetoothDevices()
        for values in bluetoothScanner.discoveredDevices{
            print(values.identifier)
            print(values.name)
            print(values.state)
        }
        self.tableView.reloadData()
    }
    
    ///The idea being here that after 10 seconds the search will STOP
    ///Restarting the search will start this timer.
    ///After 10 seconds the scan will stop
    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(stopScanningForScooters), userInfo: nil, repeats: false)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bluetoothScanner.discoveredDevices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let data = bluetoothScanner.discoveredDevices
//        let filteredData: [EventObjectValues]
//        data = Globals.eventObj
//        filteredData =
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell{
            for values in data{
                cell.name.text = "\(values.name)"
                cell.id.text = "\(values.identifier)"
                cell.state.text = "\(values.state)"
            }
            cell.iconImg.image = UIImage(named: "apollo.png")
            return cell
        }
        return cell
    
    }
    

}

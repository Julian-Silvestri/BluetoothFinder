//
//  DeviceInformationVC.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-05.
//

import UIKit

class DeviceInformationVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    var nameData:String? = ""
    var idData:String? = ""
    var stateData:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "Name: \(self.nameData ?? "N/A")"
        self.idLabel.text = "ID: \(self.idData ?? "N/A")"
        self.stateLabel.text = "State: \(self.stateData ?? "N/A")"
        
    }
    

}

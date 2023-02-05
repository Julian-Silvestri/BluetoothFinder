//
//  ViewController.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-03.
//

import CoreBluetooth
import UIKit

class HomeVC: UIViewController{

    @IBOutlet weak var mainTitle: TitleLabel!
    @IBOutlet weak var startScanBtn: StartScanButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "startScanSegue" {
//            if let destination = segue.destination as? ResultsVC {
//                //do something
//                return
//            }
//        }
//    }
    @IBAction func startScanBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "startScanSegue", sender: self)
    }
    
}


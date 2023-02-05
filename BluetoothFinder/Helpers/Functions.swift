//
//  Functions.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-05.
//

import Foundation

let bluetoothScanner = BluetoothScanner()

func appendAllFoundBluetoothDevices(){
    
    for values in bluetoothScanner.discoveredDevices{
        print(values)
    }
    
//    DiscoveredDevices.discoveredDevicesDictionary.append(<#T##newElement: NSDictionary##NSDictionary#>)
    
}

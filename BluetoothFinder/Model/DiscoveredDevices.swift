//
//  DiscoveredDevices.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-04.
//

import Foundation


///
///This class represents the discovered bluetooth devices.
///Saving the devices id's in core data will make re-connection easier to previously scanned devices.
///Using the *discoveredDevicesDictionary* dictionary, we are able to append the data to save to core data
class DiscoveredDevices{
    
    let name, type, state: String
    
    static var discoveredDevicesDictionary = [NSDictionary]()
    
    init(name: String, type: String, state: String){
        self.name = name
        self.type = type
        self.state = state
    }
    
}

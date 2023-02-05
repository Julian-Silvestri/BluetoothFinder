//
//  BluetoothScanner.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-03.
//

import Foundation
import CoreBluetooth
import Combine

class BluetoothScanner: NSObject, CBCentralManagerDelegate {

    public var manager: CBCentralManager!
    public var discoveredDevices = Set<CBPeripheral>()
    private var discoveredDevicesPublisher: AnyPublisher<Set<CBPeripheral>, Never> {
        return Publishers.Sequence(sequence: [discoveredDevices]).eraseToAnyPublisher()
    }
    
    override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
      switch (central.state){
        case .unknown:
          
          print("DEVICE STATE = unknown")
//          Global.currentDeviceState = central.state.rawValue
        case .resetting:
          print("DEVICE STATE = resetting")
          Global.currentDeviceState = central.state.rawValue
        case .unsupported:
          print("DEVICE STATE = unsupported")
          Global.currentDeviceState = central.state.rawValue
        case .unauthorized:
          print("DEVICE STATE = unauthorized \(central.state.rawValue)")
          Global.currentDeviceState = central.state.rawValue
          print(Global.currentDeviceState)
          //user has declined the use of bluetooth services
          alertActionBasic(viewController: HomeVC(), title: "Bluetooth Disabled", message: "You have declined this app's usage of the bluetooth services. As a result you will not be able to use the bluetooth scanning feature to find a scooter near you. You will be able to change this permission within your iPhone settings. Settings -> Bluetooth Access -> allow", completionHandler: {_ in
              return
          })
        case .poweredOff:
          print("DEVICE STATE = poweredOff")
          Global.currentDeviceState = central.state.rawValue
        case .poweredOn:
          print("DEVICE STATE = poweredOn")
          Global.currentDeviceState = central.state.rawValue
          manager.scanForPeripherals(withServices: nil)
        @unknown default:
          print("DEVICE STATE = unknown")
      }
      
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber){
//        print(peripheral)
        
        
        discoveredDevices.insert(peripheral)
//        debugPrint(discoveredDevices)
        
    }

    
    
}

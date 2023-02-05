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
        case .resetting:
          print("DEVICE STATE = resetting")
        case .unsupported:
          print("DEVICE STATE = unsupported")
        case .unauthorized:
          print("DEVICE STATE = unauthorized")
        case .poweredOff:
          print("DEVICE STATE = poweredOff")
        case .poweredOn:
          print("DEVICE STATE = poweredOn")
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

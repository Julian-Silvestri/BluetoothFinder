//
//  Functions.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-05.
//

import Foundation
import UIKit


func alertActionBasic(viewController: UIViewController, title:String, message: String, completionHandler: @escaping(Bool?)->Void){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: {action in
        completionHandler(true)
    }))
    viewController.present(alertController, animated: true)
}

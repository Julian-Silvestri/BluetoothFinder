//
//  TitleLabel.swift
//  BluetoothFinder
//
//  Created by Julian Silvestri on 2023-02-03.
//

import UIKit

class TitleLabel: UILabel {
    
    var textSize = 26.0
    var colorOfText = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }
    
    func setStyle(){
        self.font = .systemFont(ofSize: textSize)
        self.textColor = colorOfText
        
    }

}

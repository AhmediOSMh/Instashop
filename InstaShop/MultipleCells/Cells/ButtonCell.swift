//
//  ButtonCell.swift
//  Multifinance
//
//  Created by Aymen Hechmi on 06/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

class ButtonCell: BaseCell {
    
    var actionBlock: (() -> Void)?

    //MARK: Private Properties
    @IBOutlet fileprivate weak var actionBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onActionButton(btn: UIButton){
        actionBlock?()
    }
    
    override func setTitle(title: String) {
        actionBtn.setTitle(title, for: .normal)
    }
    

}

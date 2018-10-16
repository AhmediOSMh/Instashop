//
//  DropdownCell.swift
//  Multifinance
//
//  Created by Aymen Hechmi on 06/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

class DropdownCell: BaseCell {
    //MARK: Private Properties
    @IBOutlet fileprivate weak var titleLbl: UILabel!
    @IBOutlet fileprivate weak var dropdownBtn: UIButton!
    @IBOutlet fileprivate weak var pickedTitleLbl: UILabel!

    //MARK: Internal Properties
    var actionBlock: (([String]) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setButtonTitle(title: String){
        pickedTitleLbl.text = title
    }
    
    override func setTitle(title: String) {
        titleLbl.text = title
    }
    
    override func pickerOptionsSet() {
        //pickedTitleLbl.text = pickerOptions[0]
    }
    
    @IBAction func onActionButton(btn: UIButton){
        actionBlock?(pickerOptions)
    }

    override func textFieldTextSetted(text: String) {
       pickedTitleLbl.text = text
    }
}

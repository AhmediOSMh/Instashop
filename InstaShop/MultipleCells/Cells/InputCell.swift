//
//  InputCell.swift
//  Multifinance
//
//  Created by Aymen Hechmi on 06/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

class InputCell: BaseCell {

    //MARK: Private Properties
    @IBOutlet fileprivate weak var titleLbl: UILabel!
    @IBOutlet fileprivate weak var inputTxt: CustomPaddingTF!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setTitle(title: String) {
        titleLbl.text = title
    }
    override func setPlaceholder(placeholder: String) {
        inputTxt.placeholder = placeholder
    }
    override func setKeyboardType(type: UIKeyboardType) {
        inputTxt.keyboardType = type
    }
    override func textFieldTextSetted(text: String) {
        inputTxt.text = text
    }
    
    @IBAction func textDidChange(textField: UITextField){
        if let txt = textField.text{
            textChangedBlock?(txt)
        }
    }
}
extension InputCell: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

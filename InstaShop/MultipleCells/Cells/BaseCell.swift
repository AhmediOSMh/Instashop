//
//  BaseCell.swift
//  Multifinance
//
//  Created by Aymen Hechmi on 06/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {

    //MARK: Internal Properties
    var type: CellType!
    var pickerOptions: [String]!{
        didSet{
            pickerOptionsSet()
        }
    }

    var inputText: String! {
        didSet {
            textFieldTextSetted(text: inputText)
        }
    }
    var textChangedBlock: ((String) -> Void)?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
        
    func setForm(title: String, placeholder: String, keyboardType: UIKeyboardType){
        set(title: title, placeholder: placeholder, image: "", secureEntry: false, keyboardType: keyboardType)
    }

    func set(title: String, placeholder: String, image: String, secureEntry: Bool, keyboardType: UIKeyboardType){
        setTitle(title: title)
        setPlaceholder(placeholder:  placeholder)
        setKeyboardType(type: keyboardType)
        setImage(image: image)
        setSecureEntry(isSecure: secureEntry)
    }

    func setTitle(title: String){}
    func setPlaceholder(placeholder: String){}
    func setKeyboardType(type: UIKeyboardType){}
    func setSecureEntry(isSecure: Bool){}
    func setImage(image: String){}
    func setTextAlignment(textAlignment: NSTextAlignment){}
    func pickerOptionsSet(){}
    func textFieldTextSetted(text: String){}
    
}

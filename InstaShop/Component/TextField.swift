//
//  TextField.swift
//  GenericApp
//
//  Created by Ahmed Mh on 1/29/18.
//  Copyright © 2018 AhmedMh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TextField : UITextField
{
    @IBInspectable var key :String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if(LanguageManger.shared.isRightToLeft && self.textAlignment==NSTextAlignment.left){
            self.textAlignment=NSTextAlignment.right;
            
        }
        self .setPlaceholderText()
    }
    func setPlaceholderText ()  {
        let  string=NSLocalizedString(self.key, comment: "")
        self.placeholder=string
        
    }
}


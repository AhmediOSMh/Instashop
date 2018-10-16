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
        self.addBottomBorderWithColor(color: .lightGray , height: 1 )
    }
    func setPlaceholderText ()  {
        let  string=NSLocalizedString(self.key, comment: "")
        self.placeholder=string
        
    }
    
}

extension TextField {
    func addBottomBorderWithColor(color: UIColor, height: CGFloat) {
        let border = UIView()
        border.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        border.frame = CGRect(x:self.frame.origin.x,
                              y :self.frame.origin.y+self.frame.height-height, width : self.frame.width,height: height)
        border.backgroundColor = color
        self.superview!.insertSubview(border, aboveSubview: self)
    }
    
   
}


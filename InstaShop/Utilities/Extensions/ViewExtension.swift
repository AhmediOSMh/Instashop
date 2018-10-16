//
//  ViewExtension.swift
//  Multifinance
//
//  Created by Sarah Jmaiel on 11/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: - Fade in / out animations
    func fadeIn() {
        //
        self.alpha -= 10
        self.isHidden = false
        
        UIView.animate(withDuration: 0.2){
            self.alpha += 10
        }
        //
    }
    
    func fadeOut() {
        //
        UIView.animate(withDuration: 0.2 , animations: {
            self.alpha -= 10
        }, completion: { finish in
            self.isHidden = true
            self.alpha += 10
        })
    }
}

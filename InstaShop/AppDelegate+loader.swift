//
//  AppDelegate+loader.swift
//  Multifinance
//
//  Created by Sarah Jmaiel on 11/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    static func showLoader() {
        
        guard let window =  UIApplication.shared.keyWindow else { return }
        let loader = LoaderContainer()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.tag = 666636
        
        window.addSubview(loader)
        loader.heightAnchor.constraint(equalTo: window.heightAnchor).isActive   = true
        loader.widthAnchor.constraint(equalTo: window.widthAnchor).isActive     = true
        loader.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
        loader.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        loader.showLoader()

    }
    
    static func hideLoader() {
        guard let window =  UIApplication.shared.keyWindow else { return }
        for subView in window.subviews {
            if subView.tag == 666636 {
                subView.removeFromSuperview()
            }
        }
    }
}

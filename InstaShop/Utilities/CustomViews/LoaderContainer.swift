//
//  LoaderContainer.swift
//  Multifinance
//
//  Created by Sarah Jmaiel on 11/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

class LoaderContainer: UIView {

    lazy var loader: LoaderApp = {
        let loader = LoaderApp()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.isHidden = true
        return loader
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        
        addSubview(loader)
        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: centerYAnchor ).isActive = true
        loader.widthAnchor.constraint(equalToConstant: 146).isActive = true
        loader.heightAnchor.constraint(equalToConstant : 46).isActive = true
    }
    
    func showLoader() {
        
        self.loader.fadeIn()
        self.loader.startLoader()
    }
    
    func hideLoader() {
        
        self.loader.stopLoader()
        self.loader.fadeOut()
    }

}

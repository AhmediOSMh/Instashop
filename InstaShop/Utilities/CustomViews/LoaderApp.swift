//
//  LoaderApp.swift
//  Multifinance
//
//  Created by Sarah Jmaiel on 11/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

class LoaderApp: UIView {

    // MARK: - Loader views and functions
    lazy var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    //
    lazy var effectView : UIView = {
        let effectView = UIView()
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.layer.cornerRadius = 4
        effectView.layer.masksToBounds = true
        effectView.backgroundColor = UIColor.blue
        effectView.isHidden = true
        return effectView
    }()
    //
    lazy var strLabel : UILabel = {
        let strLabel = UILabel()
        strLabel.translatesAutoresizingMaskIntoConstraints = false
        strLabel.font = UIFont(name: "OpenSans", size: 12.0)
        strLabel.textColor = .white
        strLabel.textAlignment = .center
        strLabel.text = "Chargement..."
        return strLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoader()
    }
    //
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //
    func setupLoader() {
        
        self.addSubview(effectView)
        effectView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        effectView.centerYAnchor.constraint(equalTo: self.centerYAnchor ).isActive = true
        effectView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        effectView.heightAnchor.constraint(equalTo : heightAnchor).isActive = true
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        
        effectView.addSubview(activityIndicator)
        
        //
        effectView.addSubview(strLabel)
        strLabel.leadingAnchor.constraint(equalTo: activityIndicator.leadingAnchor, constant : 8).isActive = true
        strLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        strLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        strLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    //
    func startLoader() {
        activityIndicator.startAnimating()
        effectView.fadeIn()
    }
    
    func stopLoader(){
        activityIndicator.stopAnimating()
        //
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (Timer) in
            self.effectView.fadeOut()
        }
    }

}

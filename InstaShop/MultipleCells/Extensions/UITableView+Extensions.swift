//
//  UITableView+Extensions.swift
//  Multifinance
//
//  Created by Aymen Hechmi on 06/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNibForCellClass(_ cellClass: UITableViewCell.Type) {
        let cellReuseIdentifier = cellClass.cellReuseIdentifier()
        let nibCell = UINib(nibName: cellReuseIdentifier, bundle: nil)
        register(nibCell, forCellReuseIdentifier: cellReuseIdentifier)
    }
}

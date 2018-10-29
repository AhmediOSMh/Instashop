//
//  Fonts.swift
//  InstaShop
//
//  Created by mouadh allani on 10/28/18.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import Foundation
import UIKit

class Fonts {
    static func setboldStyle(label :UILabel) {
       label.font = UIFont(name: label.font.fontName, size: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
    }
}

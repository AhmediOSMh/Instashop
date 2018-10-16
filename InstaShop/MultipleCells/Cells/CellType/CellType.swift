//
//  CellType.swift
//  Multifinance
//
//  Created by Aymen Hechmi on 06/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import Foundation
import UIKit

enum CellType{
    
    case input
    case inputLong
    case dropdown
    case button
    case view
    
    func getHeight() -> CGFloat{
        switch self {
        case .input, .dropdown, .button: return 80
        case .inputLong,.view: return 115
        }
    }
    
    func getClass() -> BaseCell.Type{
        switch self {
        case .input: return InputCell.self
        case .inputLong: return InputLongCell.self
        case .dropdown: return DropdownCell.self
        case .button: return ButtonCell.self
        case .view : return ViewCell.self
        }
    }
}

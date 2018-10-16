//
//  DateUtils.swift
//  Multifinance
//
//  Created by Sarah Jmaiel on 17/03/2018.
//  Copyright © 2018 Aymen Hechmi. All rights reserved.
//

import UIKit

class DateUtils: NSObject {

    static func toDate(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd" //Your date format
        let date = dateFormatter.date(from: dateString)
        return date
    }
}

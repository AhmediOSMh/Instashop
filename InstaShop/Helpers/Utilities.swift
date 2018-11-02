//
//  Utilities.swift
//  GenericApp
//
//  Created by Ahmed Mh on 1/29/18.
//  Copyright © 2018 Machinestalk. All rights reserved.
//

import Foundation
import UIKit

func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
func UIColorFromHex (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func SetCircleUIImage(image: UIImageView) -> UIImageView{
    image.layer.borderWidth=1.0
    image.layer.masksToBounds = false
    image.layer.borderColor = UIColor.white.cgColor
    image.layer.cornerRadius = image.frame.size.height/2
    image.clipsToBounds = true
    return image
    
}
func SetCircleUIButton(button: UIButton) -> UIButton{
    button.layer.borderWidth=1.0
    button.layer.masksToBounds = false
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.cornerRadius = button.frame.size.height/2
    button.clipsToBounds = true
    return button
    
}
func decode(jwtToken jwt: String) -> [String: Any] {
    let segments = jwt.components(separatedBy: ".")
    return decodeJWTPart(segments[1]) ?? [:]
}

func base64UrlDecode(_ value: String) -> Data? {
    var base64 = value
        .replacingOccurrences(of: "-", with: "+")
        .replacingOccurrences(of: "_", with: "/")
    
    let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
    let requiredLength = 4 * ceil(length / 4.0)
    let paddingLength = requiredLength - length
    if paddingLength > 0 {
        let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
        base64 = base64 + padding
    }
    return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
}

func decodeJWTPart(_ value: String) -> [String: Any]? {
    guard let bodyData = base64UrlDecode(value),
        let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
            return nil
    }
    
    return payload
}

func getDateFormatFromString(originDateString : String) -> String {
    
    var convertedString = originDateString
    
    if originDateString.count > 0 {
        let dateString = originDateString[0..<10]
        let timeString = originDateString[11..<16]
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatConverted = DateFormatter()
        dateFormatConverted.dateFormat = "dd/MM/yyyy"
        
        let date = dateFormatterGet.date(from: dateString)
        let desiredDateString = dateFormatConverted.string(from: date!) // get date format string
        
        let timeFormatterGet = DateFormatter()
        timeFormatterGet.dateFormat = "HH:mm"
        
        let timeFormatConverted = DateFormatter()
        timeFormatConverted.dateFormat = "HH:mm a"
        timeFormatConverted.amSymbol = "AM"
        timeFormatConverted.pmSymbol = "PM"
        
        let time = timeFormatterGet.date(from: timeString)
        let desiredTimeString = timeFormatConverted.string(from: time!)  // get time format string
        
        
        convertedString = desiredDateString + " " + desiredTimeString
    }
    
    
    return convertedString
    
}


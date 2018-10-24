//
//  BaseViewController.swift
//  InstaShop
//
//  Created by Ahmed Mh on 20/10/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//



import UIKit

class BaseViewController: UIViewController {
    
    var isKeyboardShown = false
    var originalY: CGFloat = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - helpers methods
    func alert(message: String, title: String = "") {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, !isKeyboardShown {
            isKeyboardShown = true
            self.navigationController?.navigationBar.isHidden = true
            let yPosition: CGFloat = self.view.frame.origin.y - 140
            UIView.animate(withDuration: 0.5) {
                self.view.frame.origin.y = yPosition
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let _ = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, isKeyboardShown {
            isKeyboardShown = false
            self.navigationController?.navigationBar.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.view.frame.origin.y = self.originalY
            }
        }
    }
    
    
}

extension BaseViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidPhoneNumber(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let regEx = "^((\\+)|(00)|[0-9])[0-9]{6,14}$"
        let tester = NSPredicate(format:"SELF MATCHES %@", regEx)
        return tester.evaluate(with: testStr)
    }
    
    
    
}


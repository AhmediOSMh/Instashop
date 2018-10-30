//
//  SignInViewController.swift
//  InstaShop
//
//  Created by mouadh allani on 10/21/18.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController , UITextFieldDelegate{
    @IBOutlet weak var email: TextField!
    @IBOutlet weak var password: TextField!
    @IBOutlet weak var LoginLabel: UILabel!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var iconCardLeft: UIImageView!
    @IBOutlet weak var iconCardRight: UIImageView!
    @IBOutlet weak var ChangeLangBtn: Button!
    @IBOutlet weak var facebookBtn: Button!
    @IBOutlet weak var googlePlusBtn: Button!
    var params: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Fonts.setboldStyle(label: signInBtn.titleLabel!);
        
        if(LanguageManger.shared.isRightToLeft == true)
        {
            iconCardLeft.isHidden = false
            iconCardRight.isHidden = true
            ChangeLangBtn.setTitle("Change to English",for: .normal)
        }
        else {
            iconCardLeft.isHidden = true
            iconCardRight.isHidden = false
            ChangeLangBtn.setTitle("غير الى الانقليزية",for: .normal)
            
        }

        self.AddToolBar()
        email.delegate = self
        password.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    // add tel toolbar
    func AddToolBar(){
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        
        let doneBtn = UIBarButtonItem(
            title: "تم",
            style: .plain,
            target: self,
            action: #selector(doneButtonAction(sender:))
        )
        
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        email.inputAccessoryView = toolbar
        password.inputAccessoryView = toolbar
    }
    @objc func doneButtonAction(sender: UIBarButtonItem) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func signIn(_ sender: Any) {
        if(checkForm()){
            AppDelegate.showLoader()
            SignInService().authentication(params: params) { (result) in
                DispatchQueue.main.async {
                    AppDelegate.hideLoader()
                    if let result = result, result {
                        self.alert(message: "Succes authentication")
                    } else {
                        self.alert(message: "Fail Authentication")
                    }
                }
            }
        }
    }
    
    @IBAction func ChangeLanguage(_ sender: Any) {
        let uiAlert = UIAlertController(title: nil, message:NSLocalizedString("Alert_ChangeLanguage_Key", comment: "") , preferredStyle: UIAlertControllerStyle.alert)
        self.present(uiAlert, animated: true, completion: nil)
        
        uiAlert.addAction(UIAlertAction(title: NSLocalizedString("OK_Key", comment: ""), style: .default, handler: { action in
            if L102Language.currentAppleLanguage() == "en" {
                L102Language.setAppleLAnguageTo(lang: "ar")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
            } else {
                L102Language.setAppleLAnguageTo(lang: "en")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
            }
            exit(0)
        }))
        
        uiAlert.addAction(UIAlertAction(title: NSLocalizedString("concel_Key", comment: ""), style: .cancel, handler: { action in
            
        }))
        
    }
    @IBAction func OpenAppWithoutAccount(_ sender: Any) {
    }
    
    func checkForm()-> Bool {
        if ((email.text?.isEmpty)! || (password.text?.isEmpty)! ) {
            self.alert(message: NSLocalizedString("Validation_Alert", comment: ""))
            return false
        }
//        else if (!isValidEmail(testStr: email.text! ) && !isValidPhoneNumber(testStr: email.text! )){
//            self.alert(message:NSLocalizedString("EmailOrPhoneNotValidMsg_key", comment: "") )
//            return false
//        }
        self.params.updateValue(email.text ?? "", forKey: "phone")
        self.params.updateValue(password.text ?? "", forKey: "password")
        return true;
    }
}


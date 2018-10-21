//
//  SignUpViewController.swift
//  InstaShop
//
//  Created by Ahmed Mh on 10/10/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController , UITextFieldDelegate{
    @IBOutlet weak var name: TextField!
    @IBOutlet weak var email: TextField!
    @IBOutlet weak var tel: TextField!
    @IBOutlet weak var password: TextField!
    @IBOutlet weak var manGenderBtn: RadioButton!
    
    @IBOutlet weak var LoginLabel: UILabel!
    @IBOutlet weak var womanGenderBtn: RadioButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var iconCardLeft: UIImageView!
    @IBOutlet weak var iconCardRight: UIImageView!
    @IBOutlet weak var ChangeLangBtn: Button!
    var IsValid = false
    var params: [String: Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        womanGenderBtn.isSelected = false
        manGenderBtn.isSelected = false
        womanGenderBtn?.alternateButton = [manGenderBtn!]
        manGenderBtn?.alternateButton = [womanGenderBtn! as! RadioButton]
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
        // Validationtext field
        
        name.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        
        email.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        tel.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        password.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.AddToolBar()
        name.delegate = self
        email.delegate = self
        tel.delegate = self
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
        tel.inputAccessoryView = toolbar
        name.inputAccessoryView = toolbar
        email.inputAccessoryView = toolbar
        password.inputAccessoryView = toolbar
    }
    @objc func doneButtonAction(sender: UIBarButtonItem) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        //or
        //self.view.endEditing(true)
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (name.text?.isEmpty)! || (email.text?.isEmpty)! || (tel.text?.isEmpty)! || (password.text?.isEmpty)! {
            IsValid = false
            self.params.updateValue(name.text ?? "", forKey: "name")
            self.params.updateValue(email.text ?? "", forKey: "email")
            self.params.updateValue(tel.text ?? "", forKey: "phone")
            self.params.updateValue("man", forKey: "gender")
        } else {
            IsValid = true
        }
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
    
    @IBAction func ManGenderAction(_ sender: Any) {
        if((sender as! RadioButton).isSelected){
            (sender as AnyObject).setImage(UIImage(named: "unchekedBtn"), for: .normal)
            
        }
        else {
            (sender as AnyObject).setImage(UIImage(named: "chekedBtn"), for: .normal)
            
            
        }
    }
    @IBAction func WomanGenderAction(_ sender: Any) {
        if((sender as! RadioButton).isSelected){
            (sender as AnyObject).setImage(UIImage(named: "unchekedBtn"), for: .normal)
            
        }
        else {
            (sender as AnyObject).setImage(UIImage(named: "chekedBtn"), for: .normal)
            
            
        }
    }
    @IBAction func signUp(_ sender: Any) {
        if(IsValid){
            print ("valid")
            if (!isValidEmail(testStr: email.text! )){
                self.alert(message:NSLocalizedString("EmailNotValidMsg_key", comment: "") )
                return
            }
            else {
                AppDelegate.showLoader()
                SignUpService().execute(params: params) { (result) in
                    DispatchQueue.main.async {
                        AppDelegate.hideLoader()
                        if let result = result, result {
                            self.alert(message: "Formulaire envoyé avec succès")
                        } else {
                            self.alert(message: "Problème de connexion")
                        }
                    }
                }
            }
        }
        else {
            self.alert(message: NSLocalizedString("Validation_Alert", comment: ""))
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
}

